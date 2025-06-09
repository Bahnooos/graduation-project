import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/custom_divider.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit.dart';

import 'package:graduation_project/features/authentication/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit_states.dart';

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
              return const SizedBox(
                height: 50,
                width: double.infinity,
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is GoogleSignInFailure) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<GoogleSignInCubit>().signInWithGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.gmailButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      color: AppColor.textWhiteColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.error,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ],
              );
            }

            return ElevatedButton(
              onPressed: () {
                context.read<GoogleSignInCubit>().signInWithGoogle();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.gmailButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: FaIcon(
                FontAwesomeIcons.google,
                color: AppColor.textWhiteColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
