import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/app_logo_name.dart';

class DefaultTitle extends StatelessWidget {
  final String? appColorTitle;
  final String? whiteTitle;
  const DefaultTitle({
    super.key,
    required this.appColorTitle,
    required this.whiteTitle,
  });
  @override
  Widget build(BuildContext context) {
    return (appColorTitle == null && whiteTitle == null)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLogoName(
                logoSize: 70,
                fontSize: 40,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$appColorTitle',
                    style: Styles.latoBold36.copyWith(
                      color: AppColor.primaryColor,
                      decoration: TextDecoration.none,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    '$whiteTitle',
                    style: Styles.latoBold36.copyWith(
                      color: AppColor.textWhiteColor,
                      decoration: TextDecoration.none,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          );
  }
}
