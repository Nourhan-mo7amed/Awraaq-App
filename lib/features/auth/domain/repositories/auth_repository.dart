import '../../data/models/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login({required String email, required String password});

  Future<AuthResponse> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  });

  Future<AuthResponse> sendForgotPasswordOtp({required String email});

  Future<AuthResponse> verifyOtp({required String otp});

  Future<AuthResponse> resetPassword({
    required String password,
    required String confirmPassword,
  });

  Future<void> logout();
}
