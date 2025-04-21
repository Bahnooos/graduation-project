import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/functions/regestration_functions/email_verification_functions.dart';
import 'package:graduation_project/features/authentication/presentation/views/functions/regestration_functions/show_custom_snack_bar.dart';

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Email Verification"),
      content: Text(
        "A verification link has been sent to your email address.\n"
        "Please check your inbox and click the link to activate your account.",
      ),
      actions: [
        TextButton(
          onPressed: () async {
            bool verified = await isEmailVerified();
            if (verified) {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            } else {
              await deleteUserIfNotVerified();
              Navigator.pop(context);
              showCustomSnackBar(context, "Email not verified yet.Try again.");
            }
          },
          child: Text("I've Verified"),
        ),
      ],
    );
  }
}
