import 'package:flutter/material.dart';

class CommonMethods {

  static showSnackBar({
    required BuildContext context,
    required String message,
  }) {

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}