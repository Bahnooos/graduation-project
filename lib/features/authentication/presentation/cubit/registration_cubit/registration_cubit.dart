import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/functions/registration_functions/registration_error_handler.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/registration_cubit/registration_cubit_states.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RegistrationCubit() : super(RegistrationInitialState());

  Future<void> register(
      BuildContext context, String email, String password) async {
    emit(RegistrationLoadingState());
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;

      if (user != null) {
        await _sendVerificationEmail(user);
        emit(UnderVerificationState());
      } else {
        emit(
            RegistrationFailureState("Registration failed. Please try again."));
      }
    } on FirebaseAuthException catch (e) {
      emit(RegistrationFailureState(registrationErrorHandler(e.code)));
    } catch (e) {
      emit(RegistrationFailureState("Unexpected error: $e"));
    }
  }

  Future<void> _sendVerificationEmail(User user) async {
    try {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
    } catch (e) {
      emit(RegistrationFailureState("Failed to send verification email: $e"));
    }
  }

  Future<void> checkEmailVerification() async {
    emit(RegistrationLoadingState());
    try {
      await _auth.currentUser?.reload();
      final updatedUser = _auth.currentUser;

      if (updatedUser != null && updatedUser.emailVerified) {
        emit(VerifiedState());
      } else {
        await _deleteUserIfNotVerified();
        emit(UnverifiedState());
      }
    } catch (e) {
      emit(RegistrationFailureState("Email verification check failed: $e"));
    }
  }

  Future<void> _deleteUserIfNotVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.delete();
    }
  }

  Future<bool> isEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    User? updatedUser = FirebaseAuth.instance.currentUser;
    return updatedUser?.emailVerified ?? false;
  }
}
