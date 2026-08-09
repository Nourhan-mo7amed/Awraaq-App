abstract class EndPoints {
  static String baseUrl =
      'https://signs-micro-arabic-roles.trycloudflare.com/api';

  // Auth
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = 'auth/forgot-password';
  static const String verifyOtp = 'auth/verify-otp';
  static const String resetPassword = 'auth/reset-password';
  static const String logout = 'auth/logout';

  // Profile
  static const String profile = '/profile';
  static const String deleteAvatar = '/profile/avatar';

  // Governorates
  static const String governorates = '/governorates';

  // Home
  static const String category = '/category';

  // Location Details
  static const String locationDetails = '/locations/';
}
// abstract class EndPoints {
//   static String baseUrl = 'https://api.escuelajs.co/api/v1/';
//   static String signUp = 'users/';
//   static String login = 'auth/login';
//   static const String refreshToken = 'auth/refresh-token';
//   static const String categories = 'categories';
//   static const String products = 'products';

// }

// class ApiKey {
//   static String status = 'statusCode';
//   static String errMsg = 'error';
// }
