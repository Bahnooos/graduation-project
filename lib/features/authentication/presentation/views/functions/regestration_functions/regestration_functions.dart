import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/functions/regestration_functions/email_verification_functions.dart';
import 'package:graduation_project/features/authentication/presentation/views/functions/regestration_functions/loading_overlay.dart';
import 'package:graduation_project/features/authentication/presentation/views/functions/regestration_functions/show_custom_snack_bar.dart';

Future<User?> createUser(String email, String password) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
  return userCredential.user;
}

void handleFirebaseAuthError(BuildContext context, FirebaseAuthException e) {
  String errorMessage = "There was an error";
  if (e.code == 'email-already-in-use') {
    errorMessage = "The email is already in use";
  } else if (e.code == 'weak-password') {
    errorMessage = "The password is too weak";
  } else if (e.code == 'invalid-email') {
    errorMessage = "The email is invalid";
  }

  showCustomSnackBar(context, errorMessage);
}

Future<void> registerWithEmail(
  BuildContext context,
  String email,
  String password,
) async {
  FocusScope.of(context).unfocus();

  try {
    showLoadingOverlay(context);
    User? user = await createUser(email, password);

    if (user != null) {
      await sendVerificationEmail(user);
      hideLoadingOverlay(context);
      await showVerificationDialog(context);
      await FirebaseAuth.instance.signOut();
    } else {
      hideLoadingOverlay(context);
    }
  } on FirebaseAuthException catch (e) {
    hideLoadingOverlay(context);
    handleFirebaseAuthError(context, e);
  } catch (e) {
    hideLoadingOverlay(context);
    showCustomSnackBar(context, "Unexpected error: $e");
  }
}
