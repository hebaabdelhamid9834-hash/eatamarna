import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum SecureStorageKey { userToken, fcmToken, userData }

class SecureStorageController {
  static final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static Future<void> _writeKey(SecureStorageKey key, String value) async {
    await _storage.write(key: key.name, value: value);
  }

  static Future<String?> _readKey(SecureStorageKey key) async {
    return _storage.read(key: key.name);
  }

  static Future<String> get authToken async {
    return await _readKey(SecureStorageKey.userToken) ?? '';
  }

  static Future<void> saveAuthToken(String token) async {
    await _writeKey(SecureStorageKey.userToken, 'Bearer $token');
  }

  static Future<bool> containsKey(SecureStorageKey key) async {
    return await _storage.containsKey(key: key.name);
  }

  static Future<void> deleteKey(SecureStorageKey key) async {
    await _storage.delete(key: key.name);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
