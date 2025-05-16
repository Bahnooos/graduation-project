import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/default_view/custom_default_view_body.dart';
import 'package:graduation_project/core/widgets/default_view/default_title.dart';

class CustomDefaultView extends StatelessWidget {
  final Widget body;
  final String? appColorTitle;
  final String? whiteTitle;
  const CustomDefaultView({
    super.key,
    required this.body,
    required this.appColorTitle,
    required this.whiteTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DefaultTitle(
            appColorTitle: appColorTitle,
            whiteTitle: whiteTitle,
          ),
          CustomDefaultViewBody(
            body: body,
          ),
        ],
      ),
    );
  }
}
