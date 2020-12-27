import 'package:acleane/service/main_api.dart';
import 'package:http/http.dart';
import 'dart:convert';

class JournalProvider {
  final client = Client();

  Future<dynamic> getAllJournalsInMonth(date) async {
    // 특정 month 안 의 모든 journal 목록을 조회합니다.
    return await client.get(
        Uri.http(MainApi.baseUrl, '/journals', {'year': date.year, 'month': date.month}),
        headers: {'content-type': 'application/json'}
    );
  }

  Future<dynamic> postJournal(routineId, date) async {
    // 체크박스를 체크하면 저널을 생성합니다.
    return await client.post(
      Uri.http(MainApi.baseUrl, '/journals'),
      headers: {'content-type': 'application/json'},
      body: json.encode({
        'date': '${date.year}-${date.month}-${date.day}',
        'routine_id': routineId
      }),
    );
  }

  Future<dynamic> deleteJournal(journalId) async {
    // 활성화된 체크박스를 해제하면 저널을 삭제합니다.
    return await client.delete(
      Uri.http(MainApi.baseUrl, '/journals/${journalId}'),
      headers: {'content-type': 'application/json'}
    );
  }

}
