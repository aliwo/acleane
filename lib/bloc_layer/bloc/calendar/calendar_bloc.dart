import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  @override
  CalendarState get initialState => CalendarInitial();

  @override
  Stream<CalendarState> mapEventToState(
    CalendarEvent event,
  ) async* {
    yield CalendarPending();
    if (event is CalendarOnDaySelected) {
      yield CalendarSuccess(date: event.day);
    }
    if (event is CalendarOnVisibleDaysChanged) {
      // 달의 변경
    }
  }
}
