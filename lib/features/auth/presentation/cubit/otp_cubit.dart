import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/auth_error_mapper.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_status.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this._repository) : super(const OtpState());

  final AuthRepository _repository;

  final pinController = TextEditingController();

  bool get enableButton => pinController.text.length == 6;

  void onChanged() {
    emit(const OtpState());
  }

  Future<void> verifyOtp() async {
    if (pinController.text.length != 6) {
      emit(state.copyWith(status: AuthStatus.validationError));
      return;
    }

    emit(const OtpState(status: AuthStatus.loading));

    try {
      await _repository.verifyOtp(otp: pinController.text);
      emit(const OtpState(status: AuthStatus.success));
    } catch (error) {
      emit(
        OtpState(
          status: AuthStatus.failure,
          message: AuthErrorMapper.message(error),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    pinController.dispose();
    return super.close();
  }
}
