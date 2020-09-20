import 'package:acleane/bloc_layer/bloc/authentication/authentication_bloc.dart';
import 'package:acleane/bloc_layer/repository/auth_repository.dart';
import 'package:acleane/bloc_layer/repository/user_repository.dart';
import 'package:acleane/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // bloc repositories
  final authRepository = AuthRepository();
  final userRepository = UserRepository();

  // blocs
  final authenticationBloc = AuthenticationBloc(
    authRepository: authRepository,
  );

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
