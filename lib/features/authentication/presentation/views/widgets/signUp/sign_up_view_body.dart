import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/google_button.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/already_have_account.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/sign_up_fields.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
      ),
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
                  SignUpFields(),
                  CustomButton(
                    text: 'Signup',
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
