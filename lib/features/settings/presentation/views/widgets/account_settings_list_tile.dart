import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/settings/data/models/account_settings_model.dart';

class AccountSettingsList extends StatelessWidget {
  const AccountSettingsList({super.key, required this.accountSettingsModel});
  final AccountSettingsModel accountSettingsModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          accountSettingsModel.title,
          style: Styles.latoBold18.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        accountSettingsModel.icon,
      ],
    );
  }
}
