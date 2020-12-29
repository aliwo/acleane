part of 'api_bloc.dart';

abstract class ApiState extends Equatable {
  final String name;
  const ApiState(this.name);

  @override
  List<Object> get props => [];
}

class ApiInitial extends ApiState {
  ApiInitial(name) : super(name);

  @override
  String toString() {
    return '${name} is Initialized';
  }
}

class ApiPending extends ApiState {
  ApiPending(name) : super(name);

  @override
  String toString() {
    return '${name} is Pending';
  }
}

class ApiSuccess extends ApiState {
  final dynamic data;

  ApiSuccess(name, this.data) : super(name);

  @override
  String toString() {
    return '${name} is Loaded! { data : ${data} }';
  }
}

class ApiFailure extends ApiState {
  final Error error;

  ApiFailure(name, this.error) : super(name);

  @override
  String toString() {
    return '${name} Loads Failed! { error : ${error.toString()} }';
  }
}
