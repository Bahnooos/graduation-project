import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit_states.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/custom_divider.dart';

class GoogleButton extends StatelessWidget {
  final String text;

  const GoogleButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDivider(text: text),
        BlocBuilder<GoogleSignInCubit, GoogleSignInState>(
          builder: (context, state) {
            if (state is GoogleSignInLoading) {
              return const CircularProgressIndicator();
            }
            return ElevatedButton.icon(
              onPressed: () {
                context.read<GoogleSignInCubit>().signInWithGoogle();
              },
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: AppColor.textWhiteColor,
              ),
              label: const Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.gmailButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
            );
          },
        ),
      ],
    );
  }
}
