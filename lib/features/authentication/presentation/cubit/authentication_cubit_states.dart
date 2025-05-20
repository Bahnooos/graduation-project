import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationState {}

class InitialState extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class SuccessState extends AuthenticationState {
  final User user;
  SuccessState(this.user);
}

class FailureState extends AuthenticationState {
  final String errorMessage;
  FailureState(this.errorMessage);
}

class LoggedOutState extends AuthenticationState {}
