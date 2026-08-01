import 'auth_status.dart';

class ForgotPasswordState {
  const ForgotPasswordState({this.status = AuthStatus.initial, this.message});

  final AuthStatus status;
  final String? message;

  bool get isLoading => status == AuthStatus.loading;

  ForgotPasswordState copyWith({AuthStatus? status, String? message}) {
    return ForgotPasswordState(status: status ?? this.status, message: message);
  }
}
