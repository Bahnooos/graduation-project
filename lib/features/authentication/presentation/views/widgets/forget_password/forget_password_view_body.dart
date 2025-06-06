import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/forget_password/forget_password_cubit.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/forget_password/forget_password_cubit_states.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/forget_password/forget_password_email_field.dart';
import 'package:graduation_project/features/authentication/functions/show_custom_snack_bar.dart';
import 'package:graduation_project/features/authentication/functions/loading_overlay.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoadingState) {
          showLoadingOverlay(context);
        } else {
          hideLoadingOverlay(context);
        }

        if (state is ForgetPasswordSuccessState) {
          Navigator.pop(context);
          showCustomSnackBar(
            context,
            "Password reset link sent to your email.",
            color: AppColor.greenColor,
          );
        } else if (state is ForgetPasswordFailureState) {
          showCustomSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.textWhiteColor,
                      size: 40,
                    ),
                  ),
                  Text(
                    'Forget Password',
                    style: Styles.interBold20.copyWith(
                      fontSize: 35,
                      color: AppColor.textWhiteColor,
                    ),
                  ),
                ],
              ),
              ForgetPasswordEmailField(emailController: emailController),
              CustomButton(
                text: 'Send',
                onPressed: () {
                  BlocProvider.of<ForgetPasswordCubit>(context)
                      .forgetPasswordWithEmail(
                          context, emailController.text.trim());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
