import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_wedgets/custom_divider.dart';

class GoogleButton extends StatelessWidget {
  final String text;
  const GoogleButton({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDivider(text: text),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.gmailButtonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: FaIcon(
            FontAwesomeIcons.google,
            color: AppColor.textWhiteColor,
          ),
        ),
      ],
    );
  }
}
