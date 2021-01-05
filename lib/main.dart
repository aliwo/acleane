import 'package:acleane/bloc_layer/bloc/api/api_bloc.dart';
import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';
import 'package:acleane/bloc_layer/bloc/bloc_delegate.dart';
import 'package:acleane/bloc_layer/bloc/calendar/calendar_bloc.dart';
import 'package:acleane/bloc_layer/repository/journal_repository_mock.dart';
import 'package:acleane/bloc_layer/repository/routine_repository.dart';
import 'bloc_layer/bloc/journal/journal_bloc.dart';
import 'bloc_layer/bloc/routine/routine_bloc.dart';
import 'bloc_layer/repository/auth_repository_mock.dart';
import 'package:acleane/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_layer/repository/journal_repository.dart';
import 'bloc_layer/repository/routine_repository_mock.dart';
import 'bloc_layer/repository/user_repository_mock.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  // bloc repositories
  final authRepository = AuthRepositoryMock();
  final userRepository = UserRepositoryMock();
  final journalRepository = JournalRepositoryMock();
  final routineRepository = RoutineRepositoryMock();

  print('repository instantiated');

  // blocs
  final authenticationBloc = AuthenticationBloc(
      authRepository: authRepository, userRepository: userRepository);
  final calendarBloc = CalendarBloc();
  final userRoutineBloc = RoutineBloc(
    name: 'routine.getAllUserRoutines',
    api: () async => await routineRepository.getAllUserRoutines()
  );
  final journalBloc = JournalBloc(routineBloc: userRoutineBloc, journalRepository: journalRepository);

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
          BlocProvider<JournalBloc>(
            create: (context) => journalBloc,
          ),
          BlocProvider<RoutineBloc>(
            create: (context) => userRoutineBloc,
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}
