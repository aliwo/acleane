import 'dart:convert';

import 'package:acleane/bloc_layer/model/routine.dart';
import 'package:acleane/bloc_layer/model/user_routine.dart';
import 'package:acleane/bloc_layer/provider/routine_provider.dart';

class RoutineRepository {
  final RoutineProvider routineProvider = RoutineProvider();

  Future<dynamic> getAllRoutines() async {
    final response = await routineProvider.getAllRoutines();
    return jsonDecode(response.body)
        .map<Routine>((e) => Routine.fromJson(e))
        .toList();
  }

  Future<dynamic> getAllUserRoutines() async {
    final response = await routineProvider.getAllUserRoutines();
    return jsonDecode(response.body)
        .map<UserRoutine>((e) => UserRoutine.fromJson(e))
        .toList();
  }

}
