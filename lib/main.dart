import 'package:acleane/bloc_layer/bloc/api/api_bloc.dart';
import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';
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
  // bloc repositories
  final authRepository = AuthRepositoryMock();
  final userRepository = UserRepositoryMock();
  final journalRepository = JournalRepository();
  final routineRepository = RoutineRepository();

  print('repository instantiated');

  // blocs
  final authenticationBloc = AuthenticationBloc(
      authRepository: authRepository, userRepository: userRepository);
  final calendarBlock = CalendarBloc();
  final journalBlock = ApiBloc(
    name: 'journal',
    api: () => journalRepository.getAllJournalsInMonth(null),
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
            create: (context) => calendarBlock,
          ),
          BlocProvider<JournalApiBloc>(
            create: (context) => journalBlock,
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}
