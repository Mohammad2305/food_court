import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Good Morning",
          style: AppTextStyles.textFtS28FW700.copyWith(
            color: AppColors.whiteText,
          ),
        ),
        Text(
          "Rise and shine! It's breakfast time",
          style: AppTextStyles.textFtS12FW500.copyWith(
            color: AppColors.welcomeColor,
          ),
        ),
      ],
    ).symmetricPadding(horizontal: 36.w);
  }
}
