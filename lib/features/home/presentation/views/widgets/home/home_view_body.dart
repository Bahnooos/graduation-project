import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Partner for\nSmarter and Safer\nDriving',
            textAlign: TextAlign.center,
            style: Styles.latoBold36.copyWith(
              color: AppColor.primaryColor,
              fontSize: 40,
              height: 1,
            ),
          ),
          Text(
              'Transform your driving experience with real-time AI-powered road insights. Stay safe, stay aware start tracking now!',
              style: Styles.latoBold16.copyWith(
                color: AppColor.textBlackColor,
                height: 1.3,
              )),
          CustomButton(
            text: 'Start Tracking',
          ),
        ],
      ),
    );
  }
}
