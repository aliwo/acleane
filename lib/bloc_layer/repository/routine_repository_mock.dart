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
      // xd 기준
      Routine(id:1, name: '로아큐탄', amounts: ['1알', '2알', '3알', '4알']),
      Routine(id:2, name: '독시사이클린', amounts: ['1알', '2알', '3알', '4알']),
      Routine(id:3, name: '미노사이클린', amounts: ['1알', '2알', '3알', '4알']),
      Routine(id:4, name: 'AHA', amounts: ['적정량']),
      Routine(id:5, name: 'BHA', amounts: ['적정량']),
      Routine(id:6, name: 'PHA', amounts: ['적정량']),
      Routine(id:7, name: '벤조일페록사이드', amounts: ['한 방울', '두 방울', '세 방울', '10원 동전 크기']),
      Routine(id:8, name: '디페린', amounts: ['한 방울', '두 방울', '세 방울', '10원 동전 크기']),
      Routine(id:9, name: '비타민 A', amounts: ['3000IU', '10000IU', '20000IU', '30000IU']),
      Routine(id:10, name: '비타민 D', amounts: ['3000IU', '10000IU', '20000IU', '30000IU']),
    ];
  }

  @override
  Future<dynamic> getAllUserRoutines() async {
    return [
      UserRoutine(id: 1, routineId: 1, routineName: '로아큐탄', amount: '1 알'),
      UserRoutine(id: 2, routineId: 2, routineName: '독시사이클린', amount: '2 알')
    ];
  }
}