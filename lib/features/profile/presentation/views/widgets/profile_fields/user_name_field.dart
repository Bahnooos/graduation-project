import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/editable_profile_text_field.dart';

class UserNameField extends StatelessWidget {
  final String userName;
  final void Function(String) onSave;
  const UserNameField(
      {super.key, required this.userName, required this.onSave});
  @override
  Widget build(BuildContext context) {
    return EditableProfileTextField(
      label: 'User Name',
      initialValue: userName,
      validator: (value) =>
          value == null || value.isEmpty ? "Field cannot be empty" : null,
      onSave: onSave,
    );
  }
}
