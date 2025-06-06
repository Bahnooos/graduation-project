import 'package:firebase_auth/firebase_auth.dart';

class LoginCubitState {}

class LoginInitialState extends LoginCubitState {}

class LoginLoadingState extends LoginCubitState {}

class LoginSuccessState extends LoginCubitState {
  final User user;
  LoginSuccessState(this.user);
}

class LoginFailureState extends LoginCubitState {
  final String errorMessage;
  LoginFailureState(this.errorMessage);
}
