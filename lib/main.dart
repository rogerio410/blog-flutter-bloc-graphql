import 'package:blog_graphql_zero/core/injection/injection.dart';
import 'package:blog_graphql_zero/features/blog/presentation/cubit/all_posts_cubit.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/home_page.dart';
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
    return MaterialApp(
      title: 'Flutter Demo: Clean + Bloc + GetId',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AllPostsCubit>(
        // create: (context) => AllPostsCubit(allPosts),
        create: (_) => getIt(),
        child: const HomePage(
          title: "Flutter Demo: Clean + Bloc(Cubit) + GetId",
        ),
      ),
    );
  }
}
