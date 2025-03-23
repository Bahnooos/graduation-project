import 'package:flutter/material.dart';
import 'package:graduation_project/features/settings/data/models/custom_settings_section_model.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/custom_settings_list_tile.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/custom_settings_section.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/settings_list.dart';

class MoreSettings extends StatelessWidget {
  const MoreSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsSection(
      customSettingsSectionModel: CustomSettingsSectionModel(
        title: 'More',
        widget: List.generate(
          moreSettingsList.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CustomSettingsListTile(
              settingsModel: moreSettingsList[index],
            ),
          ),
        ),
      ),
    );
  }
}
