import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/features/authentication/functions/show_custom_snack_bar.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/authentication/functions/loading_overlay.dart';
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
        BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
          listener: (context, state) {
            if (state is GoogleSignInLoading) {
              showLoadingOverlay(context);
            } else {
              hideLoadingOverlay(context);
            }
            if (state is GoogleSignInFailure) {
              showCustomSnackBar(context, state.errorMessage);
            } else if (state is GoogleSignInSuccess) {
              Navigator.pushReplacementNamed(context, Routes.navigationHome);
            }
          },
          builder: (context, state) {
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
