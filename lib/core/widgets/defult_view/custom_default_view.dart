import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/app_logo_name.dart';
import 'package:graduation_project/core/widgets/defult_view/custom_default_view_body.dart';

class CustomDefaultView extends StatelessWidget {
  final Widget body;
  const CustomDefaultView({super.key, required this.body});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppLogoName(
            logoSize: 70,
            fontSize: 40,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomDefaultViewBody(
            body: body,
          ),
        ],
      ),
    );
  }
}
