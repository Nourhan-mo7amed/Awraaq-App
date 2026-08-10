import 'auth_status.dart';

class ResetPasswordState {
  const ResetPasswordState({
    this.status = AuthStatus.initial,
    this.passwordErrorText,
    this.confirmPasswordErrorText,
    this.message,
  });

  final AuthStatus status;
  final String? passwordErrorText;
  final String? confirmPasswordErrorText;
  final String? message;

  bool get isLoading => status == AuthStatus.loading;

  ResetPasswordState copyWith({
    AuthStatus? status,
    String? passwordErrorText,
    String? confirmPasswordErrorText,
    String? message,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      passwordErrorText: passwordErrorText,
      confirmPasswordErrorText: confirmPasswordErrorText,
      message: message,
    );
  }
}
