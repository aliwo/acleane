import 'dart:collection';

import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:acleane/bloc_layer/bloc/journal/journal_bloc.dart';
import 'package:acleane/bloc_layer/model/journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventList extends StatelessWidget {
  final LinkedHashMap<DateTime, List<Journal>> journalList; // 선택된 달의 모든 journal

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
              print(BlocProvider.of<JournalBloc>(context).state);
              return _EventElement(journal: journalList[state.date][index]);
            },
          );
        }
        return Container();
      },
    );
  }

  Widget _EventElement({Journal journal}) {
    return Container(
      child: CheckboxListTile(
        title: Text(journal.routineName),
        secondary: Text('종류'),
        controlAffinity: ListTileControlAffinity.trailing,
        value: true,
        onChanged: (bool value) {
          // journal 을 베이스로 만들어진 CheckboxListTile 은 무조건 true
          print('checkbox Changed');
        },
      ),
    );
  }
}
