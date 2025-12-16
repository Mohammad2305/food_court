import 'package:flutter/material.dart';

class AppBoxDecoration {
  static BoxDecoration general(Color background, double? radius) => BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(radius??25),
  );

  static BoxDecoration welcomeButton(Color background) => BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(25),
  );
}
