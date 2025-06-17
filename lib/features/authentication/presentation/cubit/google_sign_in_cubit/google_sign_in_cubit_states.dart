import 'package:graduation_project/core/repositories/user_model.dart';

abstract class GoogleSignInState {}

class GoogleSignInInitial extends GoogleSignInState {}

class GoogleSignInLoading extends GoogleSignInState {}

class GoogleSignInSuccess extends GoogleSignInState {
  final UserModel user;
  GoogleSignInSuccess(this.user);
}

class GoogleSignInFailure extends GoogleSignInState {
  final String errorMessage;
  GoogleSignInFailure(this.errorMessage);
}
