import 'package:flutter/material.dart';
import 'package:graduation_project/features/settings/data/models/custom_settings_section_model.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/custom_settings_list_tile.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/custom_settings_section.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/settings_list.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsSection(
      customSettingsSectionModel: CustomSettingsSectionModel(
        title: 'Account Settings',
        widget: List.generate(
          accountSettingsList.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CustomSettingsListTile(
              settingsModel: accountSettingsList[index],
            ),
          ),
        ),
      ),
    );
  }
}
