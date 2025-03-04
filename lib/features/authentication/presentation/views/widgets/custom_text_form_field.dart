import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  const CustomTextFormField({
    super.key,
    required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.textFieldColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: hintText,
        hintStyle: Styles.latoRegular14.copyWith(
          color: AppColor.hintTextColor,
        ),
      ),
    );
  }
}
