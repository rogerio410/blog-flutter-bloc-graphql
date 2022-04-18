part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

// uninitialized — waiting to see if the user is
// authenticated or not on app start.
class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

// loading — waiting to persist/delete a token
class AuthenticationLoading extends AuthenticationState {}
