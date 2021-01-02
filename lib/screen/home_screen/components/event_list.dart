import 'dart:collection';

import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventList extends StatelessWidget {
  final LinkedHashMap<DateTime, List<String>> journalList;

  const EventList({Key key, this.journalList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<CalendarBloc>(context),
      builder: (context, state) {
        if (state is CalendarSuccess) {
          return ListView.builder(
            itemCount: journalList[state.date]?.length ?? 0,
            itemBuilder: (context, index) {
              return _EventElement(text: journalList[state.date][index]);
            },
          );
        }
        return Container();
      },
    );
  }

  Widget _EventElement({String text}) {
    return Container(
      child: Text(text),
    );
  }
}
