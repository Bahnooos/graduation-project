import 'package:flutter/material.dart';

void showLoadingOverlay(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

void hideLoadingOverlay(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
