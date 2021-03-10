import 'package:acleane/bloc_layer/bloc/api/api_bloc.dart';
import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:acleane/bloc_layer/bloc/journal/journal_bloc.dart';
import 'package:acleane/screen/home_screen/components/custom_calendar.dart';
import 'package:acleane/screen/home_screen/components/event_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String title = '곰보일기';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<JournalBloc>(context),
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomCalendar(),
              SizedBox(height: 8.0),
              Expanded(
                child: state is JournalSuccess
                    ? EventList(journalList: state.journals)
                    : CircularProgressIndicator(),
              ),
              FloatingActionButton(
                onPressed: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
