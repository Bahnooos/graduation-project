import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          minimumSize: const Size(double.infinity, 60),
        ),
        child: Text(
          text,
          style: Styles.latoBold14.copyWith(color: AppColor.textWhiteColor),
        ),
      ),
    );
  }
}
