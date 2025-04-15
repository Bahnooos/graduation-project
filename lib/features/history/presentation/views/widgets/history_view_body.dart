import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/features/history/presentation/views/widgets/video_record_card_list.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      margin: const EdgeInsets.only(top: 24),
      child: VideoRecordCardList(),
    );
  }
}
