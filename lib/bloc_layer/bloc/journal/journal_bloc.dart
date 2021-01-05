import 'dart:async';
import 'package:acleane/bloc_layer/bloc/api/api_bloc.dart';
import 'package:acleane/bloc_layer/repository/journal_repository.dart';
import 'package:meta/meta.dart';

import 'package:acleane/bloc_layer/bloc/routine/routine_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {

  RoutineBloc routineBloc;
  JournalRepository journalRepository;
  StreamSubscription routineSubscription;

  JournalBloc({@required this.routineBloc, @required this.journalRepository}) {
    routineSubscription = routineBloc.listen((state) {
      if (state is ApiSuccess) {
        add(UserRoutineLoaded((routineBloc.state as ApiSuccess).data));
      }
    });
  }

  @override
  JournalState get initialState => JournalInitial();

  @override
  Stream<JournalState> mapEventToState(JournalEvent event) async* {

  }

  Stream<JournalLoaded> mapUserRoutineLoadedEventToState(
      UserRoutineLoaded event,
      ) async* {
    List journals = await journalRepository.getAllJournalsInMonth(null);
    yield JournalLoaded(event.userRoutines, journals);
  }

}
