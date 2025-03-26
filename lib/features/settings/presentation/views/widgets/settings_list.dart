import 'package:flutter/material.dart';
import 'package:graduation_project/features/settings/data/models/settings_model.dart';

final List accountSettingsList = [
  SettingsModel(
    title: 'Edit profile',
    icon: Icon(Icons.arrow_forward_ios_outlined),
  ),
  SettingsModel(
    title: 'Change password',
    icon: Icon(Icons.arrow_forward_ios_outlined),
  ),
];

final List moreSettingsList = [
  SettingsModel(
    title: 'Privacy policy',
    icon: Icon(Icons.arrow_forward_ios_outlined),
  ),
  SettingsModel(
    title: 'Terms and conditions',
    icon: Icon(Icons.arrow_forward_ios_outlined),
  ),
];
