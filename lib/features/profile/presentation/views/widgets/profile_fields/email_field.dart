import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/profile_text_field.dart';

class EmailField extends StatelessWidget {
  final String email;
  const EmailField({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return ProfileTextField(
      label: 'Email',
      initialValue: email,
    );
  }
}
