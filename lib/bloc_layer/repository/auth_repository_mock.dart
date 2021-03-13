import 'dart:convert';
import 'package:acleane/bloc_layer/provider/auth_provider.dart';
import 'package:acleane/service/token_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repository.dart';

class AuthRepositoryMock extends AuthRepository {
  final AuthProvider authProvider = AuthProvider();

  // SIGN IN
  @override
  Future<dynamic> googleSignIn() async {
    // firebase google signin
    return 'mock-token';
  }

}
