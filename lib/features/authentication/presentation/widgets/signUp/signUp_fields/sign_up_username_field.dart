import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/custom_widgets/labeled_text_form_field.dart';

class SignUPUsernameField extends StatelessWidget {
  final TextEditingController userNameController;
  const SignUPUsernameField({
    super.key,
    required this.userNameController,
  });
  @override
  Widget build(BuildContext context) {
    return LabeledTextFormField(
      hintText: 'User Name',
      label: 'User Name',
      controller: userNameController,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'Please enter your first name';
        }
        if (!RegExp(r'^[a-zA-Z\u0621-\u064A\s]+$').hasMatch(data)) {
          return 'The text should contain letters only';
        }
        return null;
      },
    );
  }
}
