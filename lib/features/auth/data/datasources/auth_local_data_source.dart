import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAccessToken(String token);
  Future<String?> readAccessToken();
  Future<void> clearAccessToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this.storage);

  final FlutterSecureStorage storage;

  static const String _accessTokenKey = 'access_token';

  @override
  Future<void> clearAccessToken() {
    return storage.delete(key: _accessTokenKey);
  }

  @override
  Future<String?> readAccessToken() {
    return storage.read(key: _accessTokenKey);
  }

  @override
  Future<void> saveAccessToken(String token) {
    return storage.write(key: _accessTokenKey, value: token);
  }
}
