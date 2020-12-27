part of 'routine_bloc.dart';

@immutable
abstract class RoutineEvent extends Equatable {
  const RoutineEvent();

  @override
  List<Object> get props => [];

  Future<RoutineState> process(authRepository) async {
    return null;
  }

}
