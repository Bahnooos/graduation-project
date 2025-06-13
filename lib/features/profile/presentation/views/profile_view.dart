import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/default_view/custom_default_view.dart';
import 'package:graduation_project/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomDefaultView(
      appColorTitle: 'Pr',
      whiteTitle: 'ofile',
      body: ProfileViewBody(),
    );
  }
}
