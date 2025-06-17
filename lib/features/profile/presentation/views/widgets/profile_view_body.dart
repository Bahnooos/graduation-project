import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/repositories/user_model.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/authentication/models/user_data_repository.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/edit_password.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/profile_fields/email_field.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/profile_fields/password_field.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/profile_fields/user_name_field.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final currentUser = FirebaseAuth.instance.currentUser;

  UserModel? user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final fetchedUser = await UserDataRepository().fetchUserData();
    setState(() {
      user = fetchedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      print(user);
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserNameField(
            userName: user!.displayName,
            onSave: (value) async {
              if (currentUser != null) {
                await currentUser!.updateDisplayName(value);
                await currentUser!.reload();
                final updatedUser = FirebaseAuth.instance.currentUser;
                setState(() async {
                  user = UserModel(
                    uid: updatedUser!.uid,
                    email: updatedUser.email ?? '',
                    displayName: updatedUser.displayName ?? '',
                  );
                  UserDataRepository().saveUserData(user!);
                });
              }
              print("تم الحفظ: $value");
            },
          ),
          EmailField(email: user!.email),
          const SizedBox(height: 15),
          PasswordField(),
          EditPassword(
            email: user!.email,
          ),
          CustomButton(
              text: 'Logout',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text(
                      'Are you sure you want to logout?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel',
                            style: TextStyle(color: Colors.green)),
                      ),
                      TextButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.login,
                          );
                        },
                        child: const Text('Logout',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
