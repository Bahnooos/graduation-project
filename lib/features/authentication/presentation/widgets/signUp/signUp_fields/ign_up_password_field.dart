import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/custom_widgets/labeled_text_form_field.dart';

class SignUPPasswordField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  const SignUPPasswordField({
    super.key,
    required this.formKey,
    required this.passwordController,
  });
  @override
  Widget build(BuildContext context) {
    return LabeledTextFormField(
      hintText: 'Password',
      label: 'Password',
      controller: passwordController,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'Please enter your password';
        }
        if (data.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        formKey.currentState!.save();
        return null;
      },
    );
  }
}
