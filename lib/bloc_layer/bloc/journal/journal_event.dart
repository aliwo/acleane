part of 'journal_bloc.dart';

abstract class JournalEvent extends Equatable {
  const JournalEvent();

  @override
  List<Object> get props => [];
}

class UserRoutineLoaded extends JournalEvent {
  final List userRoutines;
  UserRoutineLoaded(this.userRoutines);
}



