import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/functions/login_functions/login_functions.dart';
import 'package:graduation_project/features/authentication/functions/registration_functions/email_verification_functions.dart';
import 'package:graduation_project/features/authentication/functions/registration_functions/registration_functions.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/authentication_cubit_states.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthenticationCubit() : super(InitialState());

  Future<void> signIn(String email, String password) async {
    emit(LoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;

      if (user != null) {
        emit(SuccessState(user));
      } else {
        emit(FailureState("Login failed. Please try again."));
      }
    } on FirebaseAuthException catch (e) {
      emit(FailureState(loginErrorHandler(e.code)));
    } catch (e) {
      emit(FailureState("Unexpected error: $e"));
    }
  }

  Future<void> register(
      BuildContext context, String email, String password) async {
    emit(LoadingState());
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;

      if (user != null) {
        await user.sendEmailVerification();
        await showVerificationDialog(context);
        emit(SuccessState(user));
        await FirebaseAuth.instance.signOut();
        emit(LoggedOutState());
      } else {
        emit(FailureState("Registration failed. Please try again."));
      }
    } on FirebaseAuthException catch (e) {
      emit(FailureState(registrationErrorHandler(e.code)));
    } catch (e) {
      emit(FailureState("Unexpected error: $e"));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    emit(InitialState());
  }
}
