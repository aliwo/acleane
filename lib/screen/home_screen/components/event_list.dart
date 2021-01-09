import 'dart:collection';

import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:acleane/bloc_layer/bloc/journal/journal_bloc.dart';
import 'package:acleane/bloc_layer/model/journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_tile/check_tile.dart';
import 'check_tile/check_tile_factory.dart';


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
            children: _BuildEvents(journalState.userRoutines, journalList[state.date], () {})
                .values.map((x) => checkTileFactory(x).create(context)).toList(),
          );
        }
        return Container(); // TODO: 빈 리스트 뷰 리턴하면 안 되?
      },
    );
  }

  Map _BuildEvents(userRoutines, journals, context) {
    var events = {};

    // 먼저 각 userRoutine 별로 EventElement 를 형성
    for (var userRoutine in userRoutines) {
      events[userRoutine.routineId] = {
        'title': userRoutine.routineName,
        'value': false,
        'type': CheckTile.TYPE_ROUTINE,
        'routine': userRoutine
      };
    }

    // journals 를 회전하면서 routine_id 가 같은 userRoutine 이 있다면 value 를 true 로 set
    // 없다면 events 에 추가
    for (var journal in journals ?? []) {
      if (events.containsKey(journal.routineId)) {
        events[journal.routineId]['value'] = true;
        events[journal.routineId]['journal'] = journal;
      } else {
        events[journal.routineId] = {
          'title': journal.routineName,
          'value': true,
          'type': CheckTile.TYPE_JOURNAL,
          'journal': journal
        };
      }
    }
    return events;
  }
}
