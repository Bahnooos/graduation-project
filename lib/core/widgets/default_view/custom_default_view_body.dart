import 'package:flutter/material.dart';

class CustomDefaultViewBody extends StatelessWidget {
  const CustomDefaultViewBody({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.7,
        child: body,
      ),
    );
  }
}
