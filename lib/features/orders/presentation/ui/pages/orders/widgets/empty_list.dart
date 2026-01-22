import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';

class EmptyList extends StatelessWidget {
  final String orderState;
  const EmptyList({super.key, required this.orderState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 40.h,
      children: [
        SvgPicture.asset(AppAssets.emptyList),
        Text(
          "You don't have any $orderState orders at this time",
          style: AppTextStyles.textFtS28FW700.copyWith(color: AppColors.welcomeColor),
          textAlign: TextAlign.center,
        ).sized(horizontal: 280.w)
      ],
    );
  }
}
