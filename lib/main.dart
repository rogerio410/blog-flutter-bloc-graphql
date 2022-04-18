import 'package:blog_graphql_zero/core/injection/injection.dart';
import 'package:blog_graphql_zero/core/routing/route_generator.dart';
import 'package:blog_graphql_zero/core/routing/routes.dart';
import 'package:blog_graphql_zero/features/blog/presentation/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>(
      create: (_) => getIt(),
      child: MaterialApp(
        title: 'Flutter Demo: Clean + Bloc + GetId',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
        ),
        initialRoute: authCheckRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
