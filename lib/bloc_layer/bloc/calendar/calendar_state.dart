part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object> get props => [];
}

class CalendarInitial extends CalendarState {}

class CalendarPending extends CalendarState {}

class CalendarSuccess extends CalendarState {
  final DateTime date;

  CalendarSuccess({this.date});

  @override
  String toString() {
    return 'Success! { date : ${date.toString()} }';
  }
}

class CalendarFailure extends CalendarState {
  final error;
  CalendarFailure(this.error);

  @override
  String toString() {
    return 'Failed! { error : ${error.toString()} }';
  }
}
