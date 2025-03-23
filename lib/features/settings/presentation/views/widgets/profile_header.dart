import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/assets.dart';
import 'package:graduation_project/features/settings/data/models/setting_profile_model.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/profile_settings_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileSettingsWidget(
      settingsProfileModel: SettingProfileModel(
        image: Assets.logo,
        name: 'Yennefer Doe',
      ),
    );
  }
}
