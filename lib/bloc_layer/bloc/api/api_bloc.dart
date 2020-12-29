import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'api_event.dart';
part 'api_state.dart';

mixin JournalApiBloc on Bloc<ApiEvent, ApiState> {}
mixin RoutineApiBloc on Bloc<ApiEvent, ApiState> {}

/// 인자값이 행위에 따라 틀려지는 api의 경우(ex| 별점평가) event를 통해 api를 전달이 가능
/// 다만 ApiBloc의 api 인자값이 null인 경우에만 사용가능
class ApiBloc extends Bloc<ApiEvent, ApiState>
    with JournalApiBloc, RoutineApiBloc {
  final String name;
  final Future<dynamic> Function() api;
  final Future<dynamic> Function() onPending;
  final Future<dynamic> Function() onSuccess;
  final Future<dynamic> Function() onFailure;

  ApiBloc({
    @required this.name,
    @required this.api,
    this.onPending,
    this.onSuccess,
    this.onFailure,
  });

  @override
  ApiState get initialState => ApiInitial(name);

  @override
  Stream<ApiState> mapEventToState(
    ApiEvent event,
  ) async* {
    try {
      if (event is ApiLoad) {
        yield ApiPending(name);
        if (onPending != null) await onPending();
        final data = api != null ? await api() : await event.api();
        yield ApiSuccess(name, data);
        if (onSuccess != null) await onSuccess();
      }
    } catch (error) {
      yield ApiFailure(name, error);
      if (onFailure != null) await onFailure();
    }
  }
}
