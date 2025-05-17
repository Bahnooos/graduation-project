import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_color.dart';

class LedIcon extends StatefulWidget {
  const LedIcon({super.key});

  @override
  State<LedIcon> createState() => _LedIconState();
}

class _LedIconState extends State<LedIcon> {
  bool ledState = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: AppColor.whiteColor,
      activeTrackColor: AppColor.greenColor,
      value: ledState,
      onChanged: (value) => setState(() => ledState = value),
    );
  }
}
