import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../../cores/utils/constants/app_colors.dart';

class BankCardBack extends StatelessWidget {
  const BankCardBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      decoration: AppBoxDecoration.card(background: AppColors.splashColor),
      height: 195.h,
      child: Column(
        spacing: 20.h,
        children: [
          Container(
            color: Color(0xff2D2E2D),
            width: double.infinity,
            height: 50.h,
          ),
          Row(
            spacing: 20.w,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 50.h,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "123",
                    style: AppTextStyles.textFtS17FW300,
                  ).symmetricPadding(horizontal: 10.w),
                ),
              ),
              SvgPicture.asset(AppAssets.splash, height: 60.h),
            ],
          ).symmetricPadding(horizontal: 20.w),
        ],
      ),
    );
  }
}
