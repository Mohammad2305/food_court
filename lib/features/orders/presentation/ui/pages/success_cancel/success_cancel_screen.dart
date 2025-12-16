import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/shared/ui/widgets/general_app_bar.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';

class SuccessCancelScreen extends StatelessWidget {
  const SuccessCancelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: GeneralAppBar(),
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              AppAssets.successCancelled,
            ).onlyPadding(bottom: 40.h),
            Text(
              "¡Order Cancelled!",
              style: AppTextStyles.textFtS24FW900,
            ).onlyPadding(bottom: 15.h),
            Text(
              "Your order has been successfully cancelled",
              style: AppTextStyles.textFtS15FW500,
            ),
            Spacer(),
            Text(
              "If you have any question reach directly to our customer support",
              style: AppTextStyles.textFtS15FW500,
              textAlign: TextAlign.center,
            ),
          ],
        ).symmetricPadding(vertical: 40.h, horizontal: 35.w),
      ),
    );
  }
}
