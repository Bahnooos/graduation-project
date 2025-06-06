import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';

showCustomSnackBar(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
      backgroundColor: color ?? AppColor.errorColor,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
