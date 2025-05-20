import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/signUp/verification_dialog.dart';

Future<void> sendVerificationEmail(User user) async {
  if (!user.emailVerified) {
    await user.sendEmailVerification();
  }
}

Future<bool> isEmailVerified() async {
  await FirebaseAuth.instance.currentUser?.reload();
  User? updatedUser = FirebaseAuth.instance.currentUser;
  return updatedUser?.emailVerified ?? false;
}

Future<void> showVerificationDialog(BuildContext context) async {
  return await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => VerificationDialog(),
  );
}

Future<void> deleteUserIfNotVerified() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null && !user.emailVerified) {
    await user.delete();
  }
}
