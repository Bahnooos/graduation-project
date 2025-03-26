import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/settings/data/models/custom_settings_section_model.dart';

class CustomSettingsSection extends StatelessWidget {
  const CustomSettingsSection({super.key, required this.customSettingsSectionModel});
  final CustomSettingsSectionModel customSettingsSectionModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customSettingsSectionModel.title,
            style: Styles.latoBold18.copyWith(color: AppColor.settingsColor),
          ),

          Column(
            children: customSettingsSectionModel.widget,
          ),
        ],
      ),
    );
  }
}
