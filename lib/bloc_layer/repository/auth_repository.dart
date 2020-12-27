import 'dart:convert';
import 'package:acleane/bloc_layer/provider/auth_provider.dart';
import 'package:acleane/service/token_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final AuthProvider authProvider = AuthProvider();

  Future<dynamic> getToken() async {
    final token = await TokenService.getToken();
    if (token == null) {
      return null;
    } else {
      return json.decode(token);
    }
  }

  // SIGN IN
  Future<dynamic> googleSignIn() async {
    // firebase google signin
    final googleSignIn = GoogleSignIn(
      clientId: '669048621998-udqatc2g8e5tdbrdqjlrlpadqam1f38g.apps.googleusercontent.com',
      scopes: ['openid', 'https://www.googleapis.com/auth/userinfo.profile'],
      signInOption: SignInOption.standard,
    );
    try {
      final googleUser = await googleSignIn.signIn();
      final auth = await googleUser.authentication;
      final response = await authProvider.postOauthGoogle(accessToken: auth.accessToken);
      final body = json.decode(response.body);
      if (response.statusCode != 200) {
        throw Exception('No OAuth { body: ${body} }');
      }
      return body['token'];
    } catch (e) {
      print('error ${e.toString()}');
    }
  }

  // STORE TOKEN
  Future<void> storeToken({token}) async {
    await TokenService.createToken(token: token);
  }

  // SIGN OUT
  Future<void> SignOut() async {
    await TokenService.deleteToken();
  }
}
