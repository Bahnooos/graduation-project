import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/settings/data/models/settings_model.dart';

class CustomSettingsListTile extends StatelessWidget {
  const CustomSettingsListTile({super.key, required this.settingsModel});
  final SettingsModel settingsModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          settingsModel.title,
          style: Styles.latoBold18.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        settingsModel.icon,
      ],
    );
  }
}
