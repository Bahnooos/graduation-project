import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_wedgets/labeled_text_form_field.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/login/forget_password.dart';

class LoginFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledTextFormField(
          hintText: 'Email Address',
          label: 'Email',
          controller: emailController,
        ),
        LabeledTextFormField(
          hintText: 'Password',
          label: 'Password',
          controller: passwordController,
        ),
        const ForgetPassword(),
      ],
    );
  }
}
