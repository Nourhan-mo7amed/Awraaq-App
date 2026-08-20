import 'package:awraq/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'datasources/auth_local_data_source.dart';
import 'datasources/auth_remote_data_source.dart';
import 'repositories/auth_repository_impl.dart';

AuthRepositoryImpl buildAuthRepository() {
  final dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: <String, dynamic>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );

  return AuthRepositoryImpl(
    remoteDataSource: AuthRemoteDataSourceImpl(dio),
    localDataSource: AuthLocalDataSourceImpl(const FlutterSecureStorage()),
  );
}
