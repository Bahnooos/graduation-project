import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/profile_text_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});
  @override
  Widget build(BuildContext context) {
    return ProfileTextField(
      label: 'Password',
      initialValue: '********',
    );
  }
}
