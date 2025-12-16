import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import '../../../../../../../../../cores/utils/constants/app_colors.dart';

class CancelledItemActions extends StatelessWidget {
  const CancelledItemActions({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        SvgPicture.asset(AppAssets.closeCircleIcon),
        Text(
          "Order cancelled",
          style: AppTextStyles.textFtS14FW300.copyWith(
            color: AppColors.welcomeColor
          ),
        )
      ],
    );
  }
}
