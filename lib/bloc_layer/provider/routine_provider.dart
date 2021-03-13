import 'package:acleane/service/main_api.dart';
import 'package:http/http.dart';
import 'dart:convert';


class RoutineProvider {
  final client = Client();

  Future<dynamic> getAllRoutines() async {
    // 모든 routines 목록을 조회합니다.
    return await client.get(
      MainApi.baseUrl + '/routines',
      headers: {'content-type': 'application/json'}
    );
  }

  Future<dynamic> getAllUserRoutines() async {
    // 모든 user routines 목록을 조회합니다.
    return await client.get(
      MainApi.baseUrl + '/users/routines',
      headers: {'content-type': 'application/json'}
    );
  }

  Future<dynamic> postUserRoutines(routines) async {
    // user Routines 를 새로 set 합니다.
    // routines: [{'id': 1, 'amount': '문자열'}, {'id': 2, 'amount': '문자열'}]
    // 위와 같은 모양입니다.
    return await client.post(
        MainApi.baseUrl + '/routines',
        headers: {'content-type': 'application/json'},
        body: json.encode({'routines': routines})
    );
  }

}
