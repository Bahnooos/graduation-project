import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: .5,
      color: AppColor.dividerColor,
    );
  }
}