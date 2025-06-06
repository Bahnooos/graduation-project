import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/labeled_text_form_field.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return LabeledTextFormField(
      hintText: 'Email Address',
      label: 'Email',
      controller: emailController,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
