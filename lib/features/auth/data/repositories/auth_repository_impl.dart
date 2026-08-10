import 'package:dio/dio.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/auth_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  // ============================================================
  // LOGIN
  // ============================================================

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _remoteDataSource.login(
      email: email,
      password: password,
    );

    final token = response.accessToken;

    if (token != null && token.isNotEmpty) {
      await _localDataSource.saveAccessToken(token);

      print('================================');
      print('✅ ACCESS TOKEN SAVED');
      print('================================');
    }

    return response;
  }

  // ============================================================
  // REGISTER
  // ============================================================

  @override
  Future<AuthResponse> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await _remoteDataSource.register(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    );

    final token = response.accessToken;

    if (token != null && token.isNotEmpty) {
      await _localDataSource.saveAccessToken(token);
    }

    return response;
  }

  // ============================================================
  // FORGOT PASSWORD OTP
  // ============================================================

  @override
  Future<AuthResponse> sendForgotPasswordOtp({
    required String email,
  }) {
    return _remoteDataSource.sendForgotPasswordOtp(
      email: email,
    );
  }

  // ============================================================
  // VERIFY OTP
  // ============================================================

  @override
  Future<AuthResponse> verifyOtp({
    required String otp,
  }) {
    return _remoteDataSource.verifyOtp(
      otp: otp,
    );
  }

  // ============================================================
  // RESET PASSWORD
  // ============================================================

  @override
  Future<AuthResponse> resetPassword({
    required String password,
    required String confirmPassword,
  }) {
    return _remoteDataSource.resetPassword(
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  // ============================================================
  // REGISTER FCM TOKEN
  // ============================================================

  @override
  Future<void> registerFcmToken(String fcmToken) async {
    final accessToken =
        await _localDataSource.readAccessToken();

    if (accessToken == null || accessToken.isEmpty) {
      print('❌ ACCESS TOKEN NOT FOUND');
      throw Exception('Access token not found');
    }

    print('================================');
    print('🔑 ACCESS TOKEN FOUND');
    print('🔥 REGISTERING FCM TOKEN');
    print('================================');

    await _remoteDataSource.registerFcmToken(
      fcmToken: fcmToken,
      accessToken: accessToken,
    );
  }

  // ============================================================
  // LOGOUT
  // ============================================================

  @override
  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } on DioException {
      // Ignore server failure.
    } finally {
      await _localDataSource.clearAccessToken();
    }
  }
}