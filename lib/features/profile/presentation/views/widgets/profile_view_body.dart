import 'package:flutter/material.dart';
import 'package:graduation_project/core/repositories/user_data_repository.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/profile_text_field.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final fetchedUser = await fetchUserData();
    setState(() {
      user = fetchedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileTextField(
          label: 'User Name',
          initialValue: user!.name,
          validator: (value) =>
              value == null || value.isEmpty ? "Field cannot be empty" : null,
          onSave: (newValue) {
            print("تم الحفظ: $newValue");
          },
        ),
        ProfileTextField(
          label: 'Email',
          initialValue: user!.email,
          validator: (value) =>
              value == null || value.isEmpty ? "Field cannot be empty" : null,
          onSave: (newValue) {
            print("تم الحفظ: $newValue");
          },
        ),
        ProfileTextField(
          label: 'Password',
          initialValue: user!.password,
          validator: (value) =>
              value == null || value.isEmpty ? "Field cannot be empty" : null,
          onSave: (newValue) {
            print("تم الحفظ: $newValue");
          },
        ),
      ],
    );
  }
}
