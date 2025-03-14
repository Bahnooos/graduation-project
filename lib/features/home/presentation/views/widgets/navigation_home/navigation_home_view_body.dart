import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_background.dart';
import 'package:graduation_project/features/home/presentation/views/widgets/navigation_home/custom_bottom_navigation_bar.dart';

class NavigationHomeViewBody extends StatelessWidget {
  const NavigationHomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: const CustomBottomNavigationBar(),
            ),
          ),
        ],
      ),
    );
  }
}
