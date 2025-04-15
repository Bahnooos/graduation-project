import 'package:flutter/material.dart';
import 'package:graduation_project/features/history/presentation/views/widgets/video_record_card.dart';

class VideoRecordCardList extends StatelessWidget {
  const VideoRecordCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 8,
      itemBuilder: (context, index) {
        return const VideoRecordCard();
      },
    );
  }
}
