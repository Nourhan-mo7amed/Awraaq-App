import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_validations.dart';
import '../../../../core/utils/auth_error_mapper.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_status.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repository) : super(const LoginState());

  final AuthRepository _repository;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool get isValid =>
      AppValidator.email(emailController.text) == null &&
      passwordController.text.trim().isNotEmpty;

  void emailChanged(String _) {
    emit(state.copyWith(revision: state.revision + 1));
  }

  void passwordChanged(String _) {
    emit(state.copyWith(revision: state.revision + 1, passwordErrorText: null));
  }

  void togglePassword() {
    emit(
      state.copyWith(
        revision: state.revision + 1,
        obscurePassword: !state.obscurePassword,
      ),
    );
  }

  Future<void> login() async {
    final isFormValid = formKey.currentState?.validate() ?? false;
    if (!isFormValid) {
      if (isClosed) return;
      emit(state.copyWith(status: AuthStatus.validationError));
      return;
    }

    if (isClosed) return;
    emit(const LoginState(status: AuthStatus.loading));

    try {
      final response = await _repository.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (isClosed) return;

      if (response.accessToken == null || response.accessToken!.isEmpty) {
        if (isClosed) return;
        emit(
          const LoginState(
            status: AuthStatus.failure,
            message: 'Login succeeded, but no access token was returned.',
          ),
        );
        return;
      }

      if (isClosed) return;
      emit(const LoginState(status: AuthStatus.success));
    } catch (error) {
      if (isClosed) return;
      emit(
        LoginState(
          status: AuthStatus.failure,
          passwordErrorText: 'This password is incorrect.',
          message: AuthErrorMapper.message(error),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
