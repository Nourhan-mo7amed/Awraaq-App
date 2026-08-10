import 'package:awraq/core/api/end_points.dart';
import 'package:dio/dio.dart';

import '../models/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login({
    required String email,
    required String password,
  });

  Future<AuthResponse> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  });

  Future<AuthResponse> sendForgotPasswordOtp({
    required String email,
  });

  Future<AuthResponse> verifyOtp({
    required String otp,
  });

  Future<AuthResponse> resetPassword({
    required String password,
    required String confirmPassword,
  });

  Future<void> registerFcmToken({
    required String fcmToken,
    required String accessToken,
  });

  Future<AuthResponse> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.dio);

  final Dio dio;

  // ============================================================
  // LOGIN
  // ============================================================

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      EndPoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    return AuthResponse.fromJson(
      _asMap(response.data),
    );
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
    final formData = FormData.fromMap({
      'name': fullName,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      if (phone.isNotEmpty) 'phone': phone,
    });

    final response = await dio.post(
      EndPoints.register,
      data: formData,
    );

    return AuthResponse.fromJson(
      _asMap(response.data),
    );
  }

  // ============================================================
  // FORGOT PASSWORD OTP
  // ============================================================

  @override
  Future<AuthResponse> sendForgotPasswordOtp({
    required String email,
  }) async {
    final response = await dio.post(
      EndPoints.forgotPassword,
      data: {
        'email': email,
      },
    );

    return AuthResponse.fromJson(
      _asMap(response.data),
    );
  }

  // ============================================================
  // VERIFY OTP
  // ============================================================

  @override
  Future<AuthResponse> verifyOtp({
    required String otp,
  }) async {
    final response = await dio.post(
      EndPoints.verifyOtp,
      data: {
        'otp': otp,
      },
    );

    return AuthResponse.fromJson(
      _asMap(response.data),
    );
  }

  // ============================================================
  // RESET PASSWORD
  // ============================================================

  @override
  Future<AuthResponse> resetPassword({
    required String password,
    required String confirmPassword,
  }) async {
    final response = await dio.post(
      EndPoints.resetPassword,
      data: {
        'password': password,
        'confirm_password': confirmPassword,
      },
    );

    return AuthResponse.fromJson(
      _asMap(response.data),
    );
  }

  // ============================================================
  // REGISTER FCM TOKEN
  // ============================================================

  @override
  Future<void> registerFcmToken({
    required String fcmToken,
    required String accessToken,
  }) async {
    try {
      print('================================');
      print('🚀 SENDING FCM TOKEN');
      print('================================');

      print('🔥 FCM TOKEN => $fcmToken');
      print('🔑 ACCESS TOKEN EXISTS => ${accessToken.isNotEmpty}');
      print('🌐 URL => ${EndPoints.deviceTokens}');

      final response = await dio.post(
        EndPoints.deviceTokens,
        data: {
          'fcm_token': fcmToken,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print('================================');
      print('✅ FCM TOKEN SENT SUCCESSFULLY');
      print('🔥 STATUS CODE => ${response.statusCode}');
      print('🔥 RESPONSE => ${response.data}');
      print('================================');
    } on DioException catch (e) {
      print('================================');
      print('❌ FCM TOKEN SEND FAILED');
      print('================================');

      print('❌ STATUS CODE => ${e.response?.statusCode}');
      print('❌ RESPONSE => ${e.response?.data}');
      print('❌ URL => ${e.requestOptions.uri}');
      print('❌ REQUEST DATA => ${e.requestOptions.data}');
      print('❌ ERROR => ${e.message}');

      print('================================');

      rethrow;
    }
  }

  // ============================================================
  // LOGOUT
  // ============================================================

  @override
  Future<AuthResponse> logout() async {
    final response = await dio.post(
      EndPoints.logout,
    );

    return AuthResponse.fromJson(
      _asMap(response.data),
    );
  }

  // ============================================================
  // HELPER
  // ============================================================

  Map<String, dynamic> _asMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }

    return {
      'data': data,
    };
  }
}