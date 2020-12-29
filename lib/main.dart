import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';
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
      child: BlocProvider<AuthenticationBloc>(
        create: (context) => authenticationBloc,
        child: MyApp(),
      ),
    ),
  );
}
