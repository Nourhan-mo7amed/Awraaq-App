import 'package:dio/dio.dart';

import '../../../../core/api/auth_endpoints.dart';
import '../models/auth_response.dart';

abstract class AuthRemoteDataSource {
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

  Future<AuthResponse> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      AuthEndpoints.login,
      data: <String, dynamic>{'email': email, 'password': password},
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  @override
  Future<AuthResponse> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await dio.post(
      AuthEndpoints.register,
      data: <String, dynamic>{
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'password': password,
      },
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  @override
  Future<AuthResponse> sendForgotPasswordOtp({required String email}) async {
    final response = await dio.post(
      AuthEndpoints.forgotPassword,
      data: <String, dynamic>{'email': email},
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  @override
  Future<AuthResponse> verifyOtp({required String otp}) async {
    final response = await dio.post(
      AuthEndpoints.verifyOtp,
      data: <String, dynamic>{'otp': otp},
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  @override
  Future<AuthResponse> resetPassword({
    required String password,
    required String confirmPassword,
  }) async {
    final response = await dio.post(
      AuthEndpoints.resetPassword,
      data: <String, dynamic>{
        'password': password,
        'confirm_password': confirmPassword,
      },
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  @override
  Future<AuthResponse> logout() async {
    final response = await dio.post(AuthEndpoints.logout);
    return AuthResponse.fromJson(_asMap(response.data));
  }

  Map<String, dynamic> _asMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }

    return <String, dynamic>{'data': data};
  }
}
