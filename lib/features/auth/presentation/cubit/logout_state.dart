import 'auth_status.dart';

class LogoutState {
  const LogoutState({this.status = AuthStatus.initial, this.message});

  final AuthStatus status;
  final String? message;

  bool get isLoading => status == AuthStatus.loading;

  LogoutState copyWith({AuthStatus? status, String? message}) {
    return LogoutState(status: status ?? this.status, message: message);
  }
}
