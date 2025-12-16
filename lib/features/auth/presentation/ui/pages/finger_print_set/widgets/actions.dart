import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';

class FingerPrintSetActions extends StatelessWidget {
  const FingerPrintSetActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Expanded(
          child: CustomButton(
            onTap: () {},
            decoration: AppBoxDecoration.welcomeButton(AppColors.iconCircle),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            textColor: AppColors.welcomeColor,
            label: "Skip",
          ),
        ),
        Expanded(
          child: CustomButton(
            onTap: () {},
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            textColor: AppColors.whiteText,
            label: "Continue",
          ),
        )
      ],
    );
  }
}
