import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/custom_widgets/labeled_text_form_field.dart';

class ForgetPasswordEmailField extends StatelessWidget {
  final TextEditingController emailController;
  const ForgetPasswordEmailField({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: LabeledTextFormField(
        hintText: 'Email Address',
        label: 'Email',
        controller: emailController,
        validator: (data) {
          if (data == null || data.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
    );
  }
}
