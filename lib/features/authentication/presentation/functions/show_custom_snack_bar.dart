import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';

showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
      backgroundColor: AppColor.errorColor,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
