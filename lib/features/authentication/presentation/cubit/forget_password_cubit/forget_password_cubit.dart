import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/models/authentication_error_handler.dart';
import 'package:graduation_project/core/repositories/authentication_repository.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/forget_password_cubit/forget_password_cubit_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthenticationRepository authRepo;

  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitialState());

  Future<void> forgetPasswordWithEmail(
      BuildContext context, String email) async {
    FocusScope.of(context).unfocus();
    emit(ForgetPasswordLoadingState());

    try {
      await authRepo.sendPasswordResetEmail(email);
      emit(ForgetPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordFailureState(
          AuthenticationErrorHandler.forgetPassword(e.code)));
    } catch (e) {
      emit(ForgetPasswordFailureState("Unexpected error: $e"));
    }
  }
}
