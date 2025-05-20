import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.forgetPassword),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Forget Password ?',
              style: Styles.latoRegular10.copyWith(
                color: AppColor.textWhiteColor,
                decoration: TextDecoration.underline,
                decorationColor: AppColor.textWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
