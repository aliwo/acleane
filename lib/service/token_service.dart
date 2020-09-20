// 모든 repository가 storage_service 참조

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static final tokenKey = 'oauth-key';

  // GET TOKEN from SecureStorage
  static Future<dynamic> getToken() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: '$tokenKey');
    return token;
  }

  // STORE TOKEN on SecureStorage
  static Future<void> createToken({token}) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: '$tokenKey', value: json.encode(token));
  }

  // Delete TOKEN from SecureStorage
  static Future<void> deleteToken() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: '$tokenKey');
  }
}
