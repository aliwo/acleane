import 'dart:async';
import 'package:acleane/bloc_layer/repository/routine_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'routine_event.dart';
part 'routine_state.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState> {
  final RoutineRepository routineRepository;

  @override
  RoutineBloc({@required this.routineRepository})
      : assert(routineRepository != null);

  @override
  RoutineState get initialState => RoutineUninitialized();

  @override
  Stream<RoutineState> mapEventToState(
      RoutineEvent event,
      ) async* {
    yield await event.process(routineRepository);
  }
}
