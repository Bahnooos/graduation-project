import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';

class VideoRecordCardText extends StatelessWidget {
  const VideoRecordCardText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: Styles.latoBold14.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'You spent 4h',
          style: Styles.latoRegular12.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
