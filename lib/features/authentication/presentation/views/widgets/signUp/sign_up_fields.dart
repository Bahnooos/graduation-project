import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/signUp_fields/ign_up_confirm_password_field.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/signUp_fields/ign_up_email_field.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/signUp_fields/ign_up_password_field.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/signUp_fields/ign_up_username_field.dart';

class SignUpFields extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  const SignUpFields({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SignUPUsernameField(
            userNameController: userNameController,
          ),
          SignUPEmailField(
            emailController: emailController,
          ),
          SignUPPasswordField(
            passwordController: passwordController,
            formKey: formKey,
          ),
          SignUPConfirmPasswordField(
            confirmPasswordController: confirmPasswordController,
            passwordController: passwordController,
            formKey: formKey,
          ),
        ],
      ),
    );
  }
}
