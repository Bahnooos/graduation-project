import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/custom_text_password_field.dart';

class LabeledTextFormField extends StatelessWidget {
  final String hintText;
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const LabeledTextFormField({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    required this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Styles.latoBold14.copyWith(color: AppColor.textWhiteColor),
          ),
          const SizedBox(height: 5),
          isPassword
              ? CustomPasswordFormField(
                  hintText: hintText,
                  controller: controller,
                  validator: validator,
                )
              : CustomTextFormField(
                  hintText: hintText,
                  controller: controller,
                  validator: validator,
                )
        ],
      ),
    );
  }
}
