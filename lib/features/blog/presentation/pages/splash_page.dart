import 'package:blog_graphql_zero/core/routing/routes.dart';
import 'package:blog_graphql_zero/features/blog/presentation/cubit/authentication_cubit.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// https://medium.com/flutter-community/flutter-login-tutorial-with-flutter-bloc-ea606ef701ad

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        final authenticationCheckCubit = context.read<AuthenticationCubit>();
        if (state is AuthenticationUninitialized) {
          authenticationCheckCubit.appStarted();
          return const Scaffold(
            body: Center(
              child: Text('Splash Screen'),
            ),
          );
        } else if (state is AuthenticationUnauthenticated) {
          return const LoginPage();
        } else if (state is AuthenticationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          ); //   return const HomePage();
        } else {
          // Redudante for a clear understanding
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      listener: (context, state) {
        if (state is AuthenticationAuthenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            homeRoute,
            (route) => false,
          );
        }
      },
    );
  }
}
