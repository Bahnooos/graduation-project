import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/font_weight_helper.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/settings/data/models/setting_profile_model.dart';

class ProfileSettingsWidget extends StatelessWidget {
  const ProfileSettingsWidget({super.key, required this.settingsProfileModel});
  final SettingProfileModel settingsProfileModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(settingsProfileModel.image),
        ),
        title: Text(
          settingsProfileModel.name,
          style: Styles.latoBold18.copyWith(
            fontWeight: FontWeightHelper.medium,
            color: AppColor.textBlackColor,
          ),
        ),
      ),
    );
  }
}
