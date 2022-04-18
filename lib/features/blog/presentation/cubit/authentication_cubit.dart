import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'authentication_state.dart';

@lazySingleton
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationUninitialized());

  Future<void> appStarted() async {
    // Verify if exists token persisted
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthenticationLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthenticationUnauthenticated());
  }

  Future<void> loggedIn(String token) async {
    emit(AuthenticationLoading());
    // persiste token
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthenticationAuthenticated());
  }

  Future<void> loggedOut() async {
    emit(AuthenticationLoading());
    // remove token
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthenticationUnauthenticated());
  }
}
