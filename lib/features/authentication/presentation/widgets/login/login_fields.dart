import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/login/forget_password.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/login/login_fields/login_email_field.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/login/login_fields/login_password_field.dart';

class LoginFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoginEmailField(emailController: emailController),
          LoginPasswordField(passwordController: passwordController),
          const ForgetPassword(),
        ],
      ),
    );
  }
}
