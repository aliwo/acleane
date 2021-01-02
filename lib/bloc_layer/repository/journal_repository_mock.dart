import 'dart:convert';

import 'package:acleane/bloc_layer/model/journal.dart';
import 'package:acleane/bloc_layer/provider/journal_provider.dart';

import 'journal_repository.dart';

class JournalRepositoryMock extends JournalRepository {
  @override
  Future<dynamic> getAllJournalsInMonth(date) async {
    var now = DateTime.now();
    final _selectedDay = DateTime(now.year, now.month, now.day);

    return {
      _selectedDay.subtract(Duration(days: 30)): [
        Journal(id: 1, userId: 1, routineId: 1, routineName: '로아큐탄', date: _selectedDay.subtract(Duration(days: 30))),
        Journal(id: 1, userId: 1, routineId: 2, routineName: '비타민D', date: _selectedDay.subtract(Duration(days: 30))),
        Journal(id: 1, userId: 1, routineId: 3, routineName: '미노사이클린', date: _selectedDay.subtract(Duration(days: 30))),
      ],
      _selectedDay.subtract(Duration(days: 10)): [
        Journal(id: 1, userId: 1, routineId: 1, routineName: '로아큐탄', date: _selectedDay.subtract(Duration(days: 27))),
      ],
      _selectedDay.subtract(Duration(days: 3)): [
        Journal(id: 1, userId: 1, routineId: 1, routineName: '로아큐탄', date: _selectedDay.subtract(Duration(days: 20))),
        Journal(id: 1, userId: 1, routineId: 2, routineName: '비타민 D', date: _selectedDay.subtract(Duration(days: 20))),
        Journal(id: 1, userId: 1, routineId: 3, routineName: '미노사이클린', date: _selectedDay.subtract(Duration(days: 20))),
        Journal(id: 1, userId: 1, routineId: 4, routineName: '디페린', date: _selectedDay.subtract(Duration(days: 20))),
      ],
      _selectedDay.subtract(Duration(days: 2)): [
        Journal(id: 1, userId: 1, routineId: 1, routineName: '로아큐탄', date: _selectedDay.subtract(Duration(days: 16))),
        Journal(id: 1, userId: 1, routineId: 2, routineName: '비타민 D', date: _selectedDay.subtract(Duration(days: 16))),
      ],
      _selectedDay.add(Duration(days: 10)): [
        Journal(id: 1, userId: 1, routineId: 3, routineName: '미노사이클린', date: _selectedDay.subtract(Duration(days: 10))),
        Journal(id: 1, userId: 1, routineId: 4, routineName: '디페린', date: _selectedDay.subtract(Duration(days: 10))),
        Journal(id: 1, userId: 1, routineId: 2, routineName: '비타민 D', date: _selectedDay.subtract(Duration(days: 10))),
      ],
      _selectedDay.add(Duration(days: 4)): [
        Journal(id: 1, userId: 1, routineId: 3, routineName: '미노사이클린', date: _selectedDay.subtract(Duration(days: 4))),
        Journal(id: 1, userId: 1, routineId: 4, routineName: '디페린', date: _selectedDay.subtract(Duration(days: 4))),
        Journal(id: 1, userId: 1, routineId: 2, routineName: '비타민 D', date: _selectedDay.subtract(Duration(days: 4))),
      ],
      _selectedDay.add(Duration(days: 2)): [
        Journal(id: 1, userId: 1, routineId: 3, routineName: '미노사이클린', date: _selectedDay.subtract(Duration(days: 2))),
        Journal(id: 1, userId: 1, routineId: 4, routineName: '디페린', date: _selectedDay.subtract(Duration(days: 2))),
      ]
    };
  }
}
