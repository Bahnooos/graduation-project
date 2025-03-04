import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/labeled_text_form_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LabeledTextFormField(
          hintText: 'Email Address',
          label: 'Email',
        ),
        LabeledTextFormField(
          hintText: 'Password',
          label: 'Password',
        ),
      ],
    );
  }
}
