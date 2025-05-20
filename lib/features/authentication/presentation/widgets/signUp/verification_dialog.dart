import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/features/authentication/functions/show_custom_snack_bar.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/registration_cubit/registration_cubit.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/registration_cubit/registration_cubit_states.dart';

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is VerifiedState) {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/login');
        } else if (state is UnverifiedState) {
          Navigator.pop(context);
          showCustomSnackBar(context, "Email not verified yet. Try again.");
        } else if (state is RegistrationFailureState) {
          Navigator.pop(context);
          showCustomSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: const Text("Email Verification"),
          content: const Text(
            "A verification link has been sent to your email address.\n"
            "Please check your inbox and click the link to activate your account.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<RegistrationCubit>().checkEmailVerification();
              },
              child: const Text("I've Verified"),
            ),
          ],
        );
      },
    );
  }
}
