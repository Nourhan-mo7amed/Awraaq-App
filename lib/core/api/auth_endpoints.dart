class AuthEndpoints {
  AuthEndpoints._();

  static const String baseUrl =
      'https://dinner-locks-potentially-contributions.trycloudflare.com/api';

  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String forgotPassword = 'auth/forgot-password';
  static const String verifyOtp = 'auth/verify-otp';
  static const String resetPassword = 'auth/reset-password';
  static const String logout = 'auth/logout';
}
