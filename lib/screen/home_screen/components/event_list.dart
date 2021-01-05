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
    var journalState = BlocProvider.of<JournalBloc>(context).state;
    return BlocBuilder(
      bloc: BlocProvider.of<CalendarBloc>(context),
      builder: (context, state) {
        if (state is CalendarSuccess && journalState is JournalSuccess) {

          return ListView(
            children: _BuildEvents(journalState.userRoutines, journalList[state.date])
                .values.map((x) => _EventElement(title: x['title'], value: x['value'])).toList(),
          );
        }
        return Container();
      },
    );
  }

  Map _BuildEvents(userRoutines, journals) {
    var events = {};

    // 먼저 각 userRoutine 별로 EventElement 를 형성
    for (var userRoutine in userRoutines) {
      events[userRoutine.routineId] = {'title': userRoutine.routineName, 'value': false};
    }

    // journals 를 회전하면서 routine_id 가 같은 userRoutine 이 있다면 value 를 true 로 set
    // 없다면 events 에 추가
    for (var journal in journals ?? []) {
      if (events.containsKey(journal.routineId)) {
        events[journal.routineId]['value'] = true;
      } else {
        events[journal.routineId] = {'title': journal.routineName, 'value': true};
      }
    }
    return events;
  }

  Widget _EventElement({String title, bool value}) {
    return Container(
      child: CheckboxListTile(
        activeColor: Colors.deepOrange[400],
        title: Text(title),
        controlAffinity: ListTileControlAffinity.trailing,
        value: value,
        onChanged: (bool value) {
          // journal 을 베이스로 만들어진 CheckboxListTile 은 무조건 true
          print('checkbox Changed');
        },
      ),
    );
  }
}
