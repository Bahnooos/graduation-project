import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/account_settings_list_tile.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/settings_list.dart';

class AccountSettingsSeaction extends StatefulWidget {
  const AccountSettingsSeaction({super.key});

  @override
  State<AccountSettingsSeaction> createState() => _AccountSettingsSeactionState();
}

class _AccountSettingsSeactionState extends State<AccountSettingsSeaction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Settings',
            style: Styles.latoBold18.copyWith(color: AppColor.settingsColor),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: accountSettingsList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8).h,
              child: AccountSettingsList(
                accountSettingsModel: accountSettingsList[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
