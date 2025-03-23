import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/defult_view/custom_default_view.dart';
import 'package:graduation_project/features/settings/data/models/setting_profile_model.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/account_settings_seaction.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/custom_divider.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/profile_settings_widget.dart';

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
      body: Card(
        elevation: 12,
        child: Container(
          margin: EdgeInsets.all(8).r,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(16).r,
          ),
          child: Column(
            children: [
              ProfileSettingsWidget(
                settingsProfileModel: SettingProfileModel(
                  image: Assets.logo,
                  name: 'Yennefer Doe',
                ),
              ),
              CustomDivider(),
              AccountSettingsSeaction(),
            ],
          ),
        ),
      ),
    );
  }
}
