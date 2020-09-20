import 'dart:convert';

import 'package:acleane/bloc_layer/model/user.dart';
import 'package:acleane/bloc_layer/provider/user_provider.dart';

class UserRepository {
  final UserProvider userProvider = UserProvider();

  Future<dynamic> getMyProfile() async {
    final response = await userProvider.getMyProfile();
    return User.fromJson(json.decode(response.body)['user']);
  }

  Future<dynamic> putMyProfile({Map<String, dynamic> properties}) async {
    final response = await userProvider.putMyProfile(properties: properties);
    return User.fromJson(json.decode(response.body)['user']);
  }

  Future<dynamic> getProfile({userId}) async {
    var response = await userProvider.getProfile(userId);
    return User.fromJson(json.decode(response.body)['user']);
  }
}
