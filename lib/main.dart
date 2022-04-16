import 'package:blog_graphql_zero/core/injection/injection.dart';
import 'package:blog_graphql_zero/core/routing/route_generator.dart';
import 'package:blog_graphql_zero/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo: Clean + Bloc + GetId',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homeRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
