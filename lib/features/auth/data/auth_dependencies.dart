import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/api/auth_endpoints.dart';
import 'datasources/auth_local_data_source.dart';
import 'datasources/auth_remote_data_source.dart';
import 'repositories/auth_repository_impl.dart';

AuthRepositoryImpl buildAuthRepository() {
  final dio = Dio(
    BaseOptions(
      baseUrl: AuthEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: <String, dynamic>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  return AuthRepositoryImpl(
    remoteDataSource: AuthRemoteDataSourceImpl(dio),
    localDataSource: AuthLocalDataSourceImpl(const FlutterSecureStorage()),
  );
}
