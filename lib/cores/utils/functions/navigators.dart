import 'package:flutter/material.dart';

class AppNavigator {
  static void pushTo(BuildContext context, Widget nextScreen) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => nextScreen));
  }

  static void pushReplacementTo(BuildContext context, Widget nextScreen) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => nextScreen));
  }

  static void popBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
