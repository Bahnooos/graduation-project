import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/labeled_text_form_field.dart';

class SignUPEmailField extends StatelessWidget {
  final TextEditingController emailController;
  const SignUPEmailField({
    super.key,
    required this.emailController,
  });
  @override
  Widget build(BuildContext context) {
    return LabeledTextFormField(
      hintText: 'Email Address',
      label: 'Email',
      controller: emailController,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(data)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}
