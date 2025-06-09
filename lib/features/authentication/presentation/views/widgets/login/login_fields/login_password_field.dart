import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/labeled_text_form_field.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return LabeledTextFormField(
      isPassword: true,
      hintText: 'Password',
      label: 'Password',
      controller: passwordController,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
