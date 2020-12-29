part of 'api_bloc.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();

  @override
  List<Object> get props => [];
}

class ApiLoad extends ApiEvent {
  final Future<dynamic> Function() api;
  const ApiLoad({this.api});
}
