import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../../../cores/utils/constants/app_assets.dart';

class BankCardFrontInfo extends StatelessWidget {
  const BankCardFrontInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("0000 ******* 0000", style: AppTextStyles.textFtS20FW500),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Card holder name",
                  style: AppTextStyles.textFtS12FW300,
                ),
                Text(
                  "Mohammed Nasser",
                  style: AppTextStyles.textFtS14FW500,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Expiry date", style: AppTextStyles.textFtS12FW300),
                Text("04/28", style: AppTextStyles.textFtS14FW500),
              ],
            ),
            SvgPicture.asset(AppAssets.electricChip, width: 30.w),
          ],
        ).onlyPadding(top: 10.h),
      ],
    );
  }
}
