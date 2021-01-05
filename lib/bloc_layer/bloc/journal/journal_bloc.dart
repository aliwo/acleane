import 'dart:async';

import 'package:acleane/bloc_layer/bloc/routine/routine_bloc.dart';
import 'package:acleane/bloc_layer/repository/routine_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {

  RoutineBloc routineBloc;

  @override
  JournalBloc({this.routineBloc});

  @override
  JournalState get initialState => JournalInitial();

  @override
  Stream<JournalState> mapEventToState(
    JournalEvent event,
  ) async* {

  }
}
