import 'package:blog_graphql_zero/features/blog/presentation/cubit/authentication_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthenticationCubit authenticationCubit;

  LoginCubit({required this.authenticationCubit}) : super(LoginInitial());

  Future<void> loginButtonPressed(String user, String password) async {
    emit(LoginLoading());
    // authenticate user on API / Local DB etc.
    Future.delayed(const Duration(seconds: 4));
    try {
      authenticationCubit.loggedIn("Token login $user:$password");
      emit(LoginInitial());
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}
