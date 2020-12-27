part of 'routine_bloc.dart';

@immutable
abstract class RoutineState extends Equatable {
  const RoutineState();
  void onRoute(context) {}

  @override
  List<Object> get props => [];
}

/// 스크린: Home
/// 아직 아무것도 불러오지 않은 상태입니다.
class RoutineUninitialized extends RoutineState {

  @override
  void onRoute(context) async {
  }

}