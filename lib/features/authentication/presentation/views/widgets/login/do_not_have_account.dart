import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: Styles.latoRegular10.copyWith(
              color: AppColor.textWhiteColor,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signUp');
            },
            child: Text(
              'Signup',
              style: Styles.latoBold14.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
