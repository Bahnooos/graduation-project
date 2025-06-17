import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final String initialValue;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Styles.latoBold16),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          enabled: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.textFieldColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            hintStyle:
                Styles.latoRegular14.copyWith(color: AppColor.hintTextColor),
          ),
        ),
      ],
    );
  }
}
