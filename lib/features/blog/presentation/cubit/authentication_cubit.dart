import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'authentication_state.dart';

@lazySingleton
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationUninitialized());

  Future<void> appStarted() async {
    // Initilize App Stuffs and check is authenticated
    await Future.delayed(const Duration(seconds: 1));
    // emit(AuthenticationLoading());
    await Future.delayed(const Duration(milliseconds: 400));

    emit(AuthenticationUnauthenticated());
  }

  Future<void> loggedIn(String token) async {
    emit(AuthenticationLoading());
    // Call Login usecase
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthenticationAuthenticated('rogerio410'));
  }

  Future<void> loggedOut() async {
    emit(AuthenticationLoading());
    // remove token
    await Future.delayed(const Duration(seconds: 1));
    emit(AuthenticationUnauthenticated());
  }
}
