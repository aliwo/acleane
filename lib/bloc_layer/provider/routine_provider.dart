import 'package:acleane/service/main_api.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AuthProvider {
  final client = Client();

  Future<dynamic> getAllRoutines() async {
    // 모든 routines 목록을 조회합니다.
    return await client.get(
      MainApi.baseUrl + '/routines',
      headers: {'content-type': 'application/json'}
    );
  }

  Future<dynamic> postOauthKakao({accessToken}) async {
    return await client.post(
      MainApi.baseUrl + '/oauth/kakao',
      headers: {'content-type': 'application/json'},
      body: json.encode({'token': accessToken}),
    );
  }

  Future<dynamic> postOauthGoogle({accessToken}) async {
    return await client.post(
      MainApi.baseUrl + '/oauth/google',
      headers: {'content-type': 'application/json'},
      body: json.encode({'token': accessToken}),
    );
  }
}
