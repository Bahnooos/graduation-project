import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/google_button.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/login/do_not_have_account.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/login/login_fields.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Text(
            'Login',
            style: Styles.interBold40.copyWith(
              color: AppColor.textWhiteColor,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LoginFields(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {},
                  ),
                  GoogleButton(text: 'login'),
                ],
              ),
            ),
          ),
          DoNotHaveAccount(),
        ],
      ),
    );
  }
}
