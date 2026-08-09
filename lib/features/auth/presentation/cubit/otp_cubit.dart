import 'dart:async';

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
  Timer? _cooldownTimer;

  bool get enableButton => pinController.text.length == 6;

  void onChanged() {
    emit(state.copyWith(revision: state.revision + 1));
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
      final message = AuthErrorMapper.message(error);
      emit(state.copyWith(
        status: AuthStatus.failure,
        revision: state.revision + 1,
        otpErrorText: message,
      ));
    }
  }

  Future<void> resendOtp() async {
    if (state.isResending || state.cooldownSeconds > 0) return;

    emit(state.copyWith(isResending: true));

    try {
      await _repository.resendOtp();
      _startCooldown(60);
    } catch (error) {
      emit(
        state.copyWith(
          isResending: false,
          message: AuthErrorMapper.message(error),
        ),
      );
    }
  }

  void _startCooldown(int seconds) {
    emit(state.copyWith(isResending: false, cooldownSeconds: seconds));
    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }
      final remaining = state.cooldownSeconds - 1;
      if (remaining <= 0) {
        timer.cancel();
        emit(state.copyWith(cooldownSeconds: 0));
      } else {
        emit(state.copyWith(cooldownSeconds: remaining));
      }
    });
  }

  @override
  Future<void> close() {
    _cooldownTimer?.cancel();
    pinController.dispose();
    return super.close();
  }
}
