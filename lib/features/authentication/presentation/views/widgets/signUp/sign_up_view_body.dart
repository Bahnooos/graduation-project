import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/authentication/presentation/functions/registration_functions/registration_functions.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/custom_button.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/google_button.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/already_have_account.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/sign_up_fields.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Text(
            'Signup',
            style: Styles.interBold40.copyWith(
              color: AppColor.textWhiteColor,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SignUpFields(
                    userNameController: userNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    formKey: formKey,
                  ),
                  CustomButton(
                    text: 'Signup',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        registerWithEmail(
                          context,
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      }
                    },
                  ),
                  GoogleButton(text: 'signup'),
                ],
              ),
            ),
          ),
          AlreadyHaveAccount()
        ],
      ),
    );
  }
}
