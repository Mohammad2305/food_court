import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcomeScreen, (_)=>false);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Skip",
            style: AppTextStyles.textFtS15FW500.copyWith(
              color: AppColors.welcomeColor,
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: AppColors.welcomeColor,)
        ],
      ),
    ).rightAligning.onlyPadding(right: 35.w, top: 35.h);
  }
}
