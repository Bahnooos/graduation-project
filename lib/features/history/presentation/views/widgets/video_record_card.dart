import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/features/history/presentation/views/widgets/video_record_card_icon.dart';
import 'package:graduation_project/features/history/presentation/views/widgets/video_record_card_text.dart';

class VideoRecordCard extends StatelessWidget {
  const VideoRecordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColor.textFieldColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VideoRecordCardText(),
          VideoRecordCardIcon(),
        ],
      ),
    );
  }
}
