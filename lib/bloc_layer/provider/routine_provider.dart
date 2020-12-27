import 'package:acleane/service/main_api.dart';
import 'package:http/http.dart';

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
}
