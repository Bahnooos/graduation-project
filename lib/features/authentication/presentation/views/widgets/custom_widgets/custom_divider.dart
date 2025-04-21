// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  const CustomDivider({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColor.textWhiteColor.withOpacity(0.75),
              endIndent: 20,
            ),
          ),
          Text(
            'Or $text with',
            style: Styles.latoRegular10.copyWith(
              color: AppColor.textWhiteColor.withOpacity(0.75),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: AppColor.textWhiteColor.withOpacity(0.75),
              indent: 20,
            ),
          ),
        ],
      ),
    );
  }
}
