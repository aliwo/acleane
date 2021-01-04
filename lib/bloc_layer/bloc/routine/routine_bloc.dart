import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routine_event.dart';
part 'routine_state.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState> {
  @override
  RoutineState get initialState => RoutineInitial();

  @override
  Stream<RoutineState> mapEventToState(
    RoutineEvent event,
  ) async* {

  }
}
