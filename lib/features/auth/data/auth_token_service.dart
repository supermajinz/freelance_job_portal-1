import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthTokenService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveToken(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getToken(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> deleteToken(String key) async {
    await _storage.delete(key: key);
  }

  Future<bool> isAuthenticated() async {
    final accessToken = await getToken('access_token');
    return accessToken != null;
  }
}
