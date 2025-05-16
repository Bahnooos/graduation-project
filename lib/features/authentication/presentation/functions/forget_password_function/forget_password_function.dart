import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/functions/loading_overlay.dart';
import 'package:graduation_project/features/authentication/presentation/functions/show_custom_snack_bar.dart';

void handleForgetPasswordError(BuildContext context, FirebaseAuthException e) {
  String errorMessage = "Password reset failed. Please try again.";

  if (e.code == 'user-not-found') {
    errorMessage = "No user found with this email.";
  } else if (e.code == 'invalid-email') {
    errorMessage = "Invalid email format.";
  }

  showCustomSnackBar(context, errorMessage);
}

Future<void> forgetPasswordWithEmail(
  BuildContext context,
  String email,
) async {
  FocusScope.of(context).unfocus();

  try {
    showLoadingOverlay(context);

    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    hideLoadingOverlay(context);
    showCustomSnackBar(context, "A password reset email has been sent.");
  } on FirebaseAuthException catch (e) {
    hideLoadingOverlay(context);
    handleForgetPasswordError(context, e);
  } catch (e) {
    hideLoadingOverlay(context);
    showCustomSnackBar(context, "Unexpected error: $e");
  }
}
