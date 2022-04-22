import 'package:blog_graphql_zero/core/injection/injection.dart';
import 'package:blog_graphql_zero/features/blog/presentation/cubit/authentication_cubit.dart';
import 'package:blog_graphql_zero/features/blog/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit loginCubit;

  @override
  void initState() {
    loginCubit =
        LoginCubit(authenticationCubit: context.read<AuthenticationCubit>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        bloc: loginCubit,
        builder: (context, state) {
          if (state is LoginInitial || state is LoginFailure) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Login'),
              ),
              body: Center(
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    // Get data from form
                    loginCubit.loginButtonPressed('rogerio410', '123456');
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
