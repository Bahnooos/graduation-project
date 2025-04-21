import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/labeled_text_form_field.dart';

class SignUpFields extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignUpFields({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LabeledTextFormField(
          hintText: 'User Name',
          label: 'User Name',
          controller: userNameController,
        ),
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
        LabeledTextFormField(
          hintText: 'Confirm Password',
          label: 'Confirm Password',
          controller: confirmPasswordController,
        ),
      ],
    );
  }
}
