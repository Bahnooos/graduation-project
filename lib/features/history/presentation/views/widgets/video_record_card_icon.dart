import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';

class VideoRecordCardIcon extends StatelessWidget {
  const VideoRecordCardIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        height: 40,
        child: const VerticalDivider(
          color: AppColor.historyDividerColor,
          thickness: 2,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.play_circle_outline),
        color: AppColor.primaryColor,
        iconSize: 32,
      ),
    ]);
  }
}
