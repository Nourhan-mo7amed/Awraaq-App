import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/auth_error_mapper.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_status.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._repository) : super(const ForgotPasswordState());

  final AuthRepository _repository;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  bool get enableButton => emailController.text.trim().isNotEmpty;

  void onChanged() {
    emit(const ForgotPasswordState());
  }

  Future<void> sendOtp() async {
    final isFormValid = formKey.currentState?.validate() ?? false;
    if (!isFormValid) {
      emit(state.copyWith(status: AuthStatus.validationError));
      return;
    }

    emit(const ForgotPasswordState(status: AuthStatus.loading));

    try {
      await _repository.sendForgotPasswordOtp(
        email: emailController.text.trim(),
      );

      emit(const ForgotPasswordState(status: AuthStatus.success));
    } catch (error) {
      emit(
        ForgotPasswordState(
          status: AuthStatus.failure,
          message: AuthErrorMapper.message(error),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
