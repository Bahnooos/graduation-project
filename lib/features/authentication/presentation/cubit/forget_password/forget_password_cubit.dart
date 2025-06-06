import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/functions/forget_password_function/forget_password_error_handler.dart';

import 'package:graduation_project/features/authentication/presentation/cubit/forget_password/forget_password_cubit_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());

  Future<void> forgetPasswordWithEmail(
      BuildContext context, String email) async {
    FocusScope.of(context).unfocus();
    try {
      emit(ForgetPasswordLoadingState());

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      emit(ForgetPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordFailureState(getForgetPasswordErrorMessage(e)));
    } catch (e) {
      emit(ForgetPasswordFailureState("Unexpected error: $e"));
    }
  }
}
