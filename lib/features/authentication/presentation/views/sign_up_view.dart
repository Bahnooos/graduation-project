import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_background.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        body: SignUpViewBody(),
      ),
    );
  }
}
