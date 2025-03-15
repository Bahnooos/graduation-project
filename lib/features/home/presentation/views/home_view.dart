import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/defult_view/custom_default_view.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/home/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomDefaultView(
      body: HomeViewBody(),
    );
  }
}
