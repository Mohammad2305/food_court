import 'package:flutter/material.dart';
import 'package:food_court/cores/shared/themes/input_themes.dart';

class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      inputDecorationTheme: AppInputThemes.inputField,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      inputDecorationTheme: AppInputThemes.inputField,
    );
  }
}