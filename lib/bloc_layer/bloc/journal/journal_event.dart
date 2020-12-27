part of 'journal_bloc.dart';

@immutable
abstract class JournalEvent extends Equatable {
  const JournalEvent();

  @override
  List<Object> get props => [];

  Future<JournalState> process(journalRepository) async {
    return null;
  }

}
