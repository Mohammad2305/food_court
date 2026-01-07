import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../../../../../../cores/utils/constants/app_colors.dart';

class HeadBankCardFront extends StatelessWidget {
  const HeadBankCardFront({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppAssets.welcome, height: 40.h),
        Text(
          "BANK",
          style: AppTextStyles.textFtS20FW500.copyWith(
            color: AppColors.welcomeColor,
          ),
        ),
      ],
    );
  }
}
