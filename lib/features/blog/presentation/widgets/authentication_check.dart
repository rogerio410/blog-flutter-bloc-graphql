import 'package:blog_graphql_zero/features/blog/presentation/cubit/authentication_cubit.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/home_page.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/login_page.dart';
import 'package:blog_graphql_zero/features/blog/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// https://medium.com/flutter-community/flutter-login-tutorial-with-flutter-bloc-ea606ef701ad

class AuthenticationCheck extends StatefulWidget {
  const AuthenticationCheck({Key? key}) : super(key: key);

  @override
  State<AuthenticationCheck> createState() => _AuthenticationCheckState();
}

class _AuthenticationCheckState extends State<AuthenticationCheck> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        final authenticationCheckCubit = context.read<AuthenticationCubit>();

        if (state is AuthenticationUninitialized) {
          authenticationCheckCubit.appStarted();
          return const SplashPage();
        } else if (state is AuthenticationUnauthenticated) {
          return const LoginPage();
        } else if (state is AuthenticationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AuthenticationAuthenticated) {
          return const HomePage();
        } else {
          // Redudante for a clear understanding
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      // listener: (context, state) {
      //   if (state is AuthenticationAuthenticated) {
      //     Navigator.of(context).pushNamedAndRemoveUntil(
      //       homeRoute,
      //       (route) => false,
      //     );
      //   }
      // },
    );
  }
}
