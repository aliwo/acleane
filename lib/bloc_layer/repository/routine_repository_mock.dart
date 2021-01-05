import 'dart:convert';

import 'package:acleane/bloc_layer/model/routine.dart';
import 'package:acleane/bloc_layer/model/user.dart';
import 'package:acleane/bloc_layer/model/user_routine.dart';
import 'package:acleane/bloc_layer/provider/user_provider.dart';
import 'package:acleane/bloc_layer/repository/routine_repository.dart';

class RoutineRepositoryMock extends RoutineRepository {

  @override
  Future<dynamic> getAllRoutines() async {
    return [
      Routine(id:1, name: '로아큐탄', amounts: ['1알', '2알', '3알', '4알']),
      Routine(id:2, name: '미노사이클린', amounts: ['1알', '2알', '3알', '4알']),
    ];
  }

  @override
  Future<dynamic> getAllUserRoutines() async {
    return [
      UserRoutine(id: 1, routineId: 1, routineName: '로아큐탄', amount: '1 알'),
      UserRoutine(id: 2, routineId: 2, routineName: '미노사이클린', amount: '2 알')
    ];
  }
}