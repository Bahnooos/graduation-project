import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/labeled_text_form_field.dart';

class SignUPConfirmPasswordField extends StatelessWidget {
  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const SignUPConfirmPasswordField({
    super.key,
    required this.confirmPasswordController,
    required this.passwordController,
    required this.formKey,
  });
  @override
  Widget build(BuildContext context) {
    return LabeledTextFormField(
      isPassword: true,
      hintText: 'Confirm Password',
      label: 'Confirm Password',
      controller: confirmPasswordController,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'Please confirm your password';
        }
        formKey.currentState!.save();
        if (passwordController.text != confirmPasswordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
