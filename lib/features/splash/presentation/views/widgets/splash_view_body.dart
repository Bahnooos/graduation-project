import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/logo.jpg'),
            height: 100,
            width: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'asarak',
                style: Styles.interBold40.copyWith(
                  color: AppColor.textWhiteColor,
                ),
              ),
              Text(
                '\n',
                style: Styles.latoBold12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
