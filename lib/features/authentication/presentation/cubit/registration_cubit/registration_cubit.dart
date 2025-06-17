import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/core/repositories/authentication_repository.dart';
import 'package:graduation_project/features/authentication/models/authentication_error_handler.dart';
import 'package:graduation_project/features/authentication/models/save_data_into_database_model.dart';
import 'registration_cubit_states.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthenticationRepository authRepo;
  final UserDataRepository userDataRepo;

  RegistrationCubit(this.authRepo, this.userDataRepo)
      : super(RegistrationInitialState());

  Future<void> register(BuildContext context, String email, String password,
      String username) async {
    emit(RegistrationLoadingState());
    try {
      await authRepo.registerWithEmail(email, password, username);
      emit(UnderVerificationState());
    } on FirebaseAuthException catch (e) {
      emit(RegistrationFailureState(
          AuthenticationErrorHandler.registration(e.code)));
    } catch (e) {
      emit(RegistrationFailureState("Unexpected error: $e"));
    }
  }

  Future<void> checkEmailVerification() async {
    emit(RegistrationLoadingState());
    try {
      final verified = await authRepo.isEmailVerified();
      final user = FirebaseAuth.instance.currentUser;

      if (verified && user != null) {
        await userDataRepo.saveUserData(user);
        emit(VerifiedState());
      } else {
        await authRepo.deleteUserIfNotVerified();
        emit(UnverifiedState());
      }
    } catch (e) {
      emit(RegistrationFailureState("Verification check failed: $e"));
    }
  }
}
