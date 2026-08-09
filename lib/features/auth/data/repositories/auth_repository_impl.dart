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
    }

    return response;
  }

  @override
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required int governorateId,
  }) async {
    final response = await _remoteDataSource.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
      governorateId: governorateId,
    );

    final token = response.accessToken;
    if (token != null && token.isNotEmpty) {
      await _localDataSource.saveAccessToken(token);
    }

    return response;
  }

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

  @override
  Future<AuthResponse> sendForgotPasswordOtp({required String email}) {
    return _remoteDataSource.sendForgotPasswordOtp(email: email);
  }

  @override
  Future<AuthResponse> verifyOtp({required String otp}) {
    return _remoteDataSource.verifyOtp(otp: otp);
  }

  @override
  Future<AuthResponse> resendOtp() {
    return _remoteDataSource.resendOtp();
  }

  @override
  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } on DioException {
      // Ignore server failures and clear the local session anyway.
    } finally {
      await _localDataSource.clearAccessToken();
    }
  }
}
