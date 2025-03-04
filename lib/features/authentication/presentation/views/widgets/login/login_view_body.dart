import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/login/login_fields.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 130),
          Text(
            'Login',
            style: Styles.interBold40.copyWith(
              color: AppColor.textWhiteColor,
            ),
          ),
          const SizedBox(height: 50),
          LoginFields(),
        ],
      ),
    );
  }
}
