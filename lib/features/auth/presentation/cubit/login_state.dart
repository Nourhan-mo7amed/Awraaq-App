import 'auth_status.dart';

class LoginState {
  const LoginState({
    this.status = AuthStatus.initial,
    this.revision = 0,
    this.obscurePassword = true,
    this.passwordErrorText,
    this.message,
  });

  final AuthStatus status;
  final int revision;
  final bool obscurePassword;
  final String? passwordErrorText;
  final String? message;

  bool get isLoading => status == AuthStatus.loading;

  LoginState copyWith({
    AuthStatus? status,
    int? revision,
    bool? obscurePassword,
    String? passwordErrorText,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      revision: revision ?? this.revision,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      passwordErrorText: passwordErrorText,
      message: message,
    );
  }
}
