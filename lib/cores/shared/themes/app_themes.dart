import 'package:flutter/material.dart';
import '../../utils/constants/app_colors.dart';
import 'app_input_border_style.dart';

class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      inputDecorationTheme: InputDecorationThemeData(
        fillColor: AppColors.splashColor,
        filled: true,
        border: AppBorderStyles.border,
        focusedBorder: AppBorderStyles.focusedBorder,
        enabledBorder: AppBorderStyles.enabledBorder,
        errorBorder: AppBorderStyles.errorBorder,
        disabledBorder: AppBorderStyles.disabledBorder,
      ),
    );
  }
}
