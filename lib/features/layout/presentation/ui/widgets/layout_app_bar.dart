import 'package:flutter/material.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class LayoutAppBar extends StatelessWidget {
  final String screenTitle;

  const LayoutAppBar({super.key, required this.screenTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      screenTitle,
      textAlign: TextAlign.center,
      style: AppTextStyles.textFtS28FW700.copyWith(
        color: AppColors.whiteText,
      ),
    );
  }
}
