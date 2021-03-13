import 'package:acleane/service/main_api.dart';
import 'package:http/http.dart';
import 'dart:convert';

class UserProvider {
  final client = Client();

  Future<dynamic> getMyProfile() async {
    return await client.get(
      MainApi.baseUrl + '/users/me',
      headers: await MainApi().onlyTokenHeader,
    );
  }

  Future<dynamic> putMyProfile({Map<String, dynamic> properties}) async {
    return await client.put(
      MainApi.baseUrl + '/users/me',
      headers: await MainApi().defaultHeader,
      body: jsonEncode(properties),
    );
  }

  Future<dynamic> deleteMyProfile() async {
    return await client.delete(
      MainApi.baseUrl + '/users/me',
      headers: await MainApi().defaultHeader,
    );
  }

  Future<dynamic> getProfile(userId) async {
    return await client.get(
      MainApi.baseUrl + '/users/$userId',
      headers: await MainApi().onlyTokenHeader,
    );
  }

  Future<dynamic> checkNickName(nickName) async {
    return await client.get(
      MainApi.baseUrl + '/users/nickname/$nickName',
    );
  }

  Future<dynamic> uploadOccupationImage(url, occupationType) async {
    return await client.post(MainApi.baseUrl + '/users/occupation',
        headers: await MainApi().defaultHeader,
        body: jsonEncode({'occupation_type': occupationType, 'url': url}));
  }

  /// 별점 평가를 위한 유저를 불러옵니다.
  Future<dynamic> getRandomUser() async {
    return await client.get(
      MainApi.baseUrl + '/users/random',
      headers: await MainApi().onlyTokenHeader,
    );
  }

  Future<dynamic> deletePhone() async {
    return await client.delete(
      MainApi.baseUrl + '/users/phone',
      headers: await MainApi().onlyTokenHeader,
    );
  }
}
