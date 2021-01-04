import 'package:acleane/bloc_layer/bloc/api/api_bloc.dart';
import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';
import 'package:acleane/bloc_layer/bloc/bloc_delegate.dart';
import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:acleane/bloc_layer/repository/journal_repository_mock.dart';
import 'package:acleane/bloc_layer/repository/routine_repository.dart';
import 'bloc_layer/repository/auth_repository_mock.dart';
import 'package:acleane/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_layer/repository/journal_repository.dart';
import 'bloc_layer/repository/user_repository_mock.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  // bloc repositories
  final authRepository = AuthRepositoryMock();
  final userRepository = UserRepositoryMock();
  final journalRepository = JournalRepositoryMock();
  final routineRepository = RoutineRepository();

  print('repository instantiated');

  // blocs
  final authenticationBloc = AuthenticationBloc(
      authRepository: authRepository, userRepository: userRepository);
  final calendarBloc = CalendarBloc();
  final journalBloc = ApiBloc(
    name: 'journal',
    api: () async => await journalRepository.getAllJournalsInMonth(null),
    // TODO: async await 이 없어서 붙임. 이게 맞는지 화인할 것.
    // 아마 async await 없이도 돌아갔던 이유는 mock 함수가 실제 async 로직을 쓰지 않기 때문인가?
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<JournalRepository>(
          create: (context) => journalRepository,
        ),
        RepositoryProvider<RoutineRepository>(
          create: (context) => routineRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => authenticationBloc,
          ),
          BlocProvider<CalendarBloc>(
            create: (context) => calendarBloc,
          ),
          BlocProvider<JournalApiBloc>(
            create: (context) => journalBloc,
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}
