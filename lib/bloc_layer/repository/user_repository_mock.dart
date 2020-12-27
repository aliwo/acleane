import 'dart:convert';

import 'package:acleane/bloc_layer/model/user.dart';
import 'package:acleane/bloc_layer/provider/user_provider.dart';
import 'package:acleane/bloc_layer/repository/user_repository.dart';

class UserRepositoryMock extends UserRepository{

  @override
  Future<dynamic> getMyProfile() async {
    return User();
  }

  @override
  Future<dynamic> putMyProfile({Map<String, dynamic> properties}) async {
    return User();
  }

  @override
  Future<dynamic> getProfile({userId}) async {
    return User();
  }
}
