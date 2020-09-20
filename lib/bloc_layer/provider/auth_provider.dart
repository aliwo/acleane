import 'package:acleane/service/main_api.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AuthProvider {
  var client = Client();

  Future<dynamic> postOauthNaver({accessToken}) async {
    return await client.post(
      MainApi.baseUrl + '/oauth/naver',
      headers: {'content-type': 'application/json'},
      body: json.encode({'token': accessToken}),
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
