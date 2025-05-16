import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/widgets/default_view/custom_default_view.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/account_settings.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/custom_divider.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/more_settings.dart';
import 'package:graduation_project/features/settings/presentation/views/widgets/profile_header.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDefaultView(
      appColorTitle: 'Set',
      whiteTitle: 'tings',
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
              ProfileHeader(),
              CustomDivider(),
              AccountSettings(),
              CustomDivider(),
              MoreSettings(),
            ],
          ),
        ),
      ),
    );
  }
}
