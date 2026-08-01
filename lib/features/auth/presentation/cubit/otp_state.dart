import 'auth_status.dart';

class OtpState {
  const OtpState({this.status = AuthStatus.initial, this.message});

  final AuthStatus status;
  final String? message;

  bool get isLoading => status == AuthStatus.loading;

  OtpState copyWith({AuthStatus? status, String? message}) {
    return OtpState(status: status ?? this.status, message: message);
  }
}
