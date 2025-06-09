import 'package:flutter/material.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/profile_text_field.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileTextField(
          label: 'User Name',
          initialValue: 'Yennefer Doe',
          validator: (value) {
            if (value == null || value.isEmpty) return "Field cannot be empty";
            return null;
          },
          onSave: (newValue) {
            print("تم الحفظ: $newValue");
          },
        ),
        ProfileTextField(
          label: 'Email',
          initialValue: 'Yennefer Doe',
          validator: (value) {
            if (value == null || value.isEmpty) return "Field cannot be empty";
            return null;
          },
          onSave: (newValue) {
            print("تم الحفظ: $newValue");
          },
        ),
        ProfileTextField(
          label: 'Password',
          initialValue: 'Yennefer Doe',
          validator: (value) {
            if (value == null || value.isEmpty) return "Field cannot be empty";
            return null;
          },
          onSave: (newValue) {
            print("تم الحفظ: $newValue");
          },
        ),
      ],
    );
  }
}
