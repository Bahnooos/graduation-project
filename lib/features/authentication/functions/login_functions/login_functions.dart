import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/functions/loading_overlay.dart';
import 'package:graduation_project/features/authentication/functions/show_custom_snack_bar.dart';

void handleLoginError(BuildContext context, FirebaseAuthException e) {
  String errorMessage = "Login failed. Please try again.";

  if (e.code == 'user-not-found') {
    errorMessage = "No user found with this email.";
  } else if (e.code == 'wrong-password') {
    errorMessage = "Incorrect password.";
  } else if (e.code == 'invalid-email') {
    errorMessage = "Invalid email format.";
  } else if (e.code == 'user-disabled') {
    errorMessage = "This account has been disabled.";
  }

  showCustomSnackBar(context, errorMessage);
}

Future<void> loginWithEmail(
  BuildContext context,
  String email,
  String password,
) async {
  try {
    showLoadingOverlay(context);

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;

    if (user != null) {
      hideLoadingOverlay(context);
      Navigator.pushReplacementNamed(context, '/navigationHome');
    } else {
      hideLoadingOverlay(context);
      showCustomSnackBar(context, "Login failed. Please try again.");
    }
  } on FirebaseAuthException catch (e) {
    hideLoadingOverlay(context);
    handleLoginError(context, e);
  } catch (e) {
    hideLoadingOverlay(context);
    showCustomSnackBar(context, "Unexpected error: $e");
  }
}
