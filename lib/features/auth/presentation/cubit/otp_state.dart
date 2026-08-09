import 'auth_status.dart';

class OtpState {
  const OtpState({
    this.status = AuthStatus.initial,
    this.revision = 0,
    this.isResending = false,
    this.cooldownSeconds = 0,
    this.otpErrorText,
    this.message,
  });

  final AuthStatus status;
  final int revision;
  final bool isResending;
  final int cooldownSeconds;
  final String? otpErrorText;
  final String? message;

  bool get isLoading => status == AuthStatus.loading;

  OtpState copyWith({
    AuthStatus? status,
    int? revision,
    bool? isResending,
    int? cooldownSeconds,
    String? otpErrorText,
    String? message,
  }) {
    return OtpState(
      status: status ?? this.status,
      revision: revision ?? this.revision,
      isResending: isResending ?? this.isResending,
      cooldownSeconds: cooldownSeconds ?? this.cooldownSeconds,
      otpErrorText: otpErrorText ?? this.otpErrorText,
      message: message,
    );
  }
}
