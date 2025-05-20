import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_background.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/login/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        body: LoginViewBody(),
      ),
    );
  }
}
