part of 'journal_bloc.dart';

abstract class JournalState extends Equatable {
  const JournalState();

  @override
  List<Object> get props => [];
}


class JournalInitial extends JournalState {}


class JournalSuccess extends JournalState {
  final List userRoutines;
  final Map<DateTime, List<Journal>> journals;
  JournalSuccess(this.userRoutines, this.journals);
}



