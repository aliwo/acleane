import 'dart:convert';

import 'package:acleane/service/token_service.dart';

class MainApi {
  static final baseUrl = 'http://service.soyeonlab.com';

  Future get onlyTokenHeader async => {
        'Authorization': 'Bearer ${json.decode(await TokenService.getToken())}',
      };

  Future get defaultHeader async => {
        'content-type': 'application/json',
        'Authorization': 'Bearer ${json.decode(await TokenService.getToken())}',
      };

  Future get multipartFormDataHeader async => {
        'content-type': 'multipart/form-data',
        'Authorization': 'Bearer ${json.decode(await TokenService.getToken())}',
      };

  const MainApi();
}

class APIError extends Error {
  final errorMsg;
  APIError(this.errorMsg);

  @override
  String toString() => '${errorMsg}';
}

// TODO: interceptor 추가 할 것 sw
