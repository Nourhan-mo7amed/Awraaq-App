import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/auth_error_mapper.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_status.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._repository) : super(const ResetPasswordState());

  final AuthRepository _repository;

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool get enableButton =>
      passwordController.text.isNotEmpty &&
      confirmPasswordController.text.isNotEmpty;

  double get strength {
    final password = passwordController.text;

    if (password.length < 6) return .25;

    final hasUpper = password.contains(RegExp(r'[A-Z]'));
    final hasLower = password.contains(RegExp(r'[a-z]'));
    final hasNumber = password.contains(RegExp(r'[0-9]'));
    final hasSymbol = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    var score = 0;
    if (hasUpper) score++;
    if (hasLower) score++;
    if (hasNumber) score++;
    if (hasSymbol) score++;

    return score / 4;
  }

  void onChanged() {
    emit(const ResetPasswordState());
  }

  void togglePassword() {
    obscurePassword = !obscurePassword;
    emit(const ResetPasswordState());
  }

  void toggleConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    emit(const ResetPasswordState());
  }

  Future<void> resetPassword() async {
    final isFormValid = formKey.currentState?.validate() ?? false;
    if (!isFormValid) {
      emit(state.copyWith(status: AuthStatus.validationError));
      return;
    }

    if (passwordController.text.length < 8) {
      emit(
        state.copyWith(
          status: AuthStatus.validationError,
          passwordErrorText: 'This password isn\'t strong.',
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      emit(
        state.copyWith(
          status: AuthStatus.validationError,
          confirmPasswordErrorText: 'Passwords do not match.',
        ),
      );
      return;
    }

    emit(const ResetPasswordState(status: AuthStatus.loading));

    try {
      await _repository.resetPassword(
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );

      emit(const ResetPasswordState(status: AuthStatus.success));
    } catch (error) {
      emit(
        ResetPasswordState(
          status: AuthStatus.failure,
          message: AuthErrorMapper.message(error),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
