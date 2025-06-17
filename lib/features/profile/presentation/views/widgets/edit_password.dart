import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/authentication/functions/loading_overlay.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/forget_password_cubit/forget_password_cubit_states.dart';

class EditPassword extends StatelessWidget {
  final String email;
  const EditPassword({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
      if (state is ForgetPasswordLoadingState) {
        showLoadingOverlay(context);
      } else {
        hideLoadingOverlay(context);
      }

      if (state is ForgetPasswordSuccessState) {
        hideLoadingOverlay(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('edit password'),
            content: const Text(
              'Password reset link sent to your email.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }, builder: (context, state) {
      return InkWell(
        onTap: () {
          BlocProvider.of<ForgetPasswordCubit>(context)
              .forgetPasswordWithEmail(context, email);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Edit Password',
                style: Styles.latoRegular10.copyWith(
                  color: AppColor.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
