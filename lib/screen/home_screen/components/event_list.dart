import 'package:acleane/bloc_layer/bloc/api/api_bloc.dart';
import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventList extends StatelessWidget {
  final List<dynamic> journalList;

  const EventList({Key key, this.journalList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<CalendarBloc>(context),
      builder: (context, state) {
        if (state is! ApiSuccess) {
          return Container();
        }
        return ListView(
          children: journalList
              .map((e) => Container(
                    child: Text(e),
                  ))
              .toList(),
        );
      },
    );
  }
}
