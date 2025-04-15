import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/default_view/custom_default_view.dart';
import 'package:graduation_project/features/history/presentation/views/widgets/history_view_body.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomDefaultView(
      appColorTitle: 'Hi',
      whiteTitle: 'story',
      body: HistoryViewBody(),
    );
  }
}
