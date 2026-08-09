import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/auth_error_mapper.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_status.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._repository) : super(const RegisterState());

  final AuthRepository _repository;

  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final fullNameFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool agreeTerms = false;
  int governorateId = 2;

  bool get enableButton =>
      fullNameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      phoneController.text.isNotEmpty &&
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
    emit(
      state.copyWith(
        revision: state.revision + 1,
        emailErrorText: null,
        passwordErrorText: null,
        confirmPasswordErrorText: null,
      ),
    );
  }

  void togglePassword() {
    emit(
      state.copyWith(
        revision: state.revision + 1,
        obscurePassword: !state.obscurePassword,
      ),
    );
  }

  void toggleConfirmPassword() {
    emit(
      state.copyWith(
        revision: state.revision + 1,
        obscureConfirmPassword: !state.obscureConfirmPassword,
      ),
    );
  }

  void changeAgree(bool value) {
    emit(state.copyWith(revision: state.revision + 1, agreeTerms: value));
  }

  Future<void> register() async {
    final isFormValid = formKey.currentState?.validate() ?? false;
    if (!isFormValid) {
      emit(
        state.copyWith(
          status: AuthStatus.validationError,
          revision: state.revision + 1,
        ),
      );
      return;
    }

    if (passwordController.text.length < 8) {
      emit(
        state.copyWith(
          status: AuthStatus.validationError,
          revision: state.revision + 1,
          passwordErrorText: 'This password isn\'t strong.',
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      emit(
        state.copyWith(
          status: AuthStatus.validationError,
          revision: state.revision + 1,
          confirmPasswordErrorText: 'Passwords do not match.',
        ),
      );
      return;
    }

    emit(
      state.copyWith(status: AuthStatus.loading, revision: state.revision + 1),
    );

    try {
      await _repository.register(
        name: fullNameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        governorateId: governorateId,
      );

      emit(
        state.copyWith(
          status: AuthStatus.success,
          revision: state.revision + 1,
        ),
      );
    } catch (error) {
      final message = AuthErrorMapper.message(error);

      // Map validation errors to the appropriate field error texts
      if (message.toLowerCase().contains('email')) {
        emit(state.copyWith(
          status: AuthStatus.validationError,
          revision: state.revision + 1,
          emailErrorText: message,
        ));
      } else if (message.toLowerCase().contains('password')) {
        emit(state.copyWith(
          status: AuthStatus.validationError,
          revision: state.revision + 1,
          passwordErrorText: message,
        ));
      } else if (message.toLowerCase().contains('phone')) {
        // No dedicated phone error field, show generic failure
        emit(state.copyWith(
          status: AuthStatus.failure,
          revision: state.revision + 1,
          message: message,
        ));
      } else {
        // Fallback for other errors
        emit(state.copyWith(
          status: AuthStatus.failure,
          revision: state.revision + 1,
          message: message,
        ));
      }
    }
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    fullNameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();

    return super.close();
  }
}
