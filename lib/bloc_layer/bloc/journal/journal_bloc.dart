import 'dart:async';

import 'package:acleane/bloc_layer/model/user.dart';
import 'package:acleane/bloc_layer/repository/auth_repository.dart';
import 'package:acleane/bloc_layer/repository/journal_repository.dart';
import 'package:acleane/bloc_layer/repository/user_repository.dart';
import 'package:acleane/screen/sign_in_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'journal_event.dart';
part 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  final JournalRepository journalRepository;

  @override
  JournalBloc({@required this.journalRepository})
      : assert(journalRepository != null);

  @override
  JournalState get initialState => JournalUninitialized();

  @override
  Stream<JournalState> mapEventToState(
      JournalEvent event,
      ) async* {
    yield await event.process(journalRepository);
  }
}
