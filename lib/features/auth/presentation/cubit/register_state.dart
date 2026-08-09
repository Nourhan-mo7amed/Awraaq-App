import 'auth_status.dart';

class RegisterState {
  const RegisterState({
    this.status = AuthStatus.initial,
    this.revision = 0,
    this.obscurePassword = true,
    this.obscureConfirmPassword = true,
    this.agreeTerms = false,
    this.emailErrorText,
    this.passwordErrorText,
    this.confirmPasswordErrorText,
    this.message,
  });

  final AuthStatus status;
  final int revision;
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final bool agreeTerms;
  final String? emailErrorText;
  final String? passwordErrorText;
  final String? confirmPasswordErrorText;
  final String? message;

  bool get isLoading => status == AuthStatus.loading;

  RegisterState copyWith({
    AuthStatus? status,
    int? revision,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
    bool? agreeTerms,
    String? emailErrorText,
    String? passwordErrorText,
    String? confirmPasswordErrorText,
    String? message,
  }) {
    return RegisterState(
      status: status ?? this.status,
      revision: revision ?? this.revision,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
      agreeTerms: agreeTerms ?? this.agreeTerms,
      emailErrorText: emailErrorText,
      passwordErrorText: passwordErrorText,
      confirmPasswordErrorText: confirmPasswordErrorText,
      message: message,
    );
  }
}
