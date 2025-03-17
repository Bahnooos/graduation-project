import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';

class AppLogoName extends StatelessWidget {
  final double logoSize;
  final double fontSize;

  const AppLogoName({
    super.key,
    required this.logoSize,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.logo,
          height: logoSize,
          width: logoSize,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'asarak',
              style: Styles.latoBold36.copyWith(
                color: AppColor.textWhiteColor,
                decoration: TextDecoration.none,
                fontSize: fontSize,
              ),
            ),
            Text(
              '\n',
              style: Styles.latoBold12.copyWith(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
