import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';
import 'bloc_layer/repository/auth_repository_mock.dart';
import 'package:acleane/bloc_layer/repository/user_repository.dart';
import 'package:acleane/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  // bloc repositories
  final authRepository = AuthRepositoryMock();
  final userRepository = UserRepository();
  print('repository instantiated');

  // blocs
  final authenticationBloc =
      AuthenticationBloc(authRepository: authRepository, userRepository: userRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => authenticationBloc,
        ),
      ],
      child: MyApp(),
    ),
  );
}
