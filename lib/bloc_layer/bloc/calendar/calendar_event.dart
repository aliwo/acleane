part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

class CalendarOnDaySelected extends CalendarEvent {
  final DateTime day;
  final List events;
  final List holidays;

  const CalendarOnDaySelected({this.day, this.events, this.holidays});

  @override
  List<Object> get props => [];
}

class CalendarOnVisibleDaysChanged extends CalendarEvent {
  final DateTime first;
  final DateTime last;
  final CalendarFormat format;

  CalendarOnVisibleDaysChanged({
    this.first,
    this.last,
    this.format,
  });

  @override
  List<Object> get props => [];
}
