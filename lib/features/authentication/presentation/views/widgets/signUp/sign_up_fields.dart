import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/labeled_text_form_field.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LabeledTextFormField(
          hintText: 'User Name',
          label: 'User Name',
        ),
        LabeledTextFormField(
          hintText: 'Email Address',
          label: 'Email',
        ),
        LabeledTextFormField(
          hintText: 'Password',
          label: 'Password',
        ),
        LabeledTextFormField(
          hintText: 'Confirm Password',
          label: 'Confirm Password',
        ),
      ],
    );
  }
}
