import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/defult_view/custom_default_view.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDefaultView(
      title: Text.rich(TextSpan(children: [
        TextSpan(
          text: 'Set',
          style: Styles.interBold40.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
        TextSpan(
            text: 'tings',
            style: Styles.interBold40.copyWith(
              color: AppColor.textWhiteColor,
            )),
      ])),
      body: Column(
        children: [],
      ),
    );
  }
}
