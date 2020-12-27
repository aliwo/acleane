part of 'journal_bloc.dart';

@immutable
abstract class JournalState extends Equatable {
  const JournalState();
  void onRoute(context) {}

  @override
  List<Object> get props => [];
}

/// 스크린: Home
/// 아직 아무것도 불러오지 않은 상태입니다. (달력이 비어있음)
class JournalUninitialized extends JournalState {

  @override
  void onRoute(context) async {
  }

}