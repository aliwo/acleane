import 'package:acleane/bloc_layer/bloc/api/api_bloc.dart';
import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:acleane/screen/home_screen/components/custom_calendar.dart';
import 'package:acleane/screen/home_screen/components/event_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String title = '곰보일기';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<JournalApiBloc>(context).add(ApiLoad());
    final calendarState = BlocProvider.of<CalendarBloc>(context).state;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<JournalApiBloc>(context),
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomCalendar(),
              const SizedBox(height: 8.0),
              state is ApiSuccess
                  ? Expanded(
                      child: EventList(
                        selectedEvents: calendarState is CalendarSuccess
                            ? state.data[calendarState.date]
                            : [],
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          );
        },
      ),
    );
  }
}
