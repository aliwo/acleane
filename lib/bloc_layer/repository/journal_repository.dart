import 'dart:convert';

import 'package:acleane/bloc_layer/model/journal.dart';
import 'package:acleane/bloc_layer/provider/journal_provider.dart';

class JournalRepository {
  final JournalProvider journalProvider = JournalProvider();

  Future<dynamic> getAllJournalsInMonth(date) async {
    final response = await journalProvider.getAllJournalsInMonth(date);
    return jsonDecode(response.body)
        .map<Journal>((e) => Journal.fromJson(e))
        .toList();
  }

  Future<dynamic> postJournal(routineId, date) async {
    final response = await journalProvider.postJournal(routineId, date);
    return jsonDecode(response.body)['okay'];
  }

  Future<dynamic> deleteJournal(journalId) async {
    final response = await journalProvider.deleteJournal(journalId);
    return jsonDecode(response.body)['okay'];
  }

}
