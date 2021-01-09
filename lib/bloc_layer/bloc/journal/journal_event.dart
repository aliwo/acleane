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

class JournalCreated extends JournalEvent {
  final DateTime date;
  final int routineId;
  JournalCreated(this.date, this.routineId);
}

class JournalDeleted extends JournalEvent {
  final Journal journal;
  JournalDeleted(this.journal);
}

