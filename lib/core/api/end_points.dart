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
   static const String notifications = "/notifications";
}
// abstract class EndPoints {
//   static String baseUrl =
// <<<<<<< HEAD
//       'https://dinner-locks-potentially-contributions.trycloudflare.com/api';
// =======
//       'https://deemed-controls-hundreds-compatibility.trycloudflare.com/api';
//   static const String profile = "/profile";
//   static const String deleteAvatar = "/profile/avatar";
//   static const String governorates = "/governorates";
//   static const String category = "/category";
// >>>>>>> feature/home
//   static const String login = 'auth/login';
//   static const String register = 'auth/register';
//   static const String forgotPassword = 'auth/forgot-password';
//   static const String verifyOtp = 'auth/verify-otp';
//   static const String resetPassword = 'auth/reset-password';
//   static const String logout = 'auth/logout';
// <<<<<<< HEAD
//   static const String profile = "/profile";
//   static const String deleteAvatar = "/profile/avatar";
//   static const String governorates = "/governorates";

// =======
// >>>>>>> feature/home
// //   static String signUp = 'users/';
// //   static String login = 'auth/login';
// //   static const String refreshToken = 'auth/refresh-token';
// //   static const String categories = 'categories';
// //   static const String products = 'products';

// // }

// // class ApiKey {
// //   static String status = 'statusCode';
// //   static String errMsg = 'error';
// }
