import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../themes/app_boxes_decoration.dart';
import '../../../themes/app_text_styles.dart';

class IdBack extends StatelessWidget {
  const IdBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 20.w),
      decoration: AppBoxDecoration.generalCard(
        background: Colors.black,
      ),
      height: 195.h,
      child: Stack(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 20.h,
                  decoration: AppBoxDecoration.general(Colors.red, 0),
                ),
                Container(
                  height: 20.h,
                  decoration: AppBoxDecoration.general(Colors.white, 0),
                ),
                Container(
                  height: 20.h,
                  width: double.infinity,
                  decoration: AppBoxDecoration.general(Colors.black, 0),
                )
              ],
            ),
          ).rightAligning.onlyPadding(right: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 10.w,
                children: [
                  Container(
                    decoration: AppBoxDecoration.general(Colors.white, 10.r),
                    width: 60.w,
                    height: 60.h,
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      "https://i.pinimg.com/1200x/7c/58/72/7c58726c015595d5a940874a285ff936.jpg",
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "3 00 05 23 16 003 33",
                            style: AppTextStyles.textFtS12FW500.copyWith(
                              color: AppColors.whiteText,
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Male",
                                style: AppTextStyles.textFtS12FW500.copyWith(
                                  color: AppColors.whiteText,
                                )
                            ),
                            Text(
                                "Muslim",
                                style: AppTextStyles.textFtS12FW500.copyWith(
                                  color: AppColors.whiteText,
                                )
                            ),
                            Text(
                                "Single",
                                style: AppTextStyles.textFtS12FW500.copyWith(
                                  color: AppColors.whiteText,
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: AppBoxDecoration.general(Colors.white, 10.r),
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    width: 60.w,
                    height: 60.h,
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      "https://i.pinimg.com/736x/65/b0/5d/65b05d98a9db4131538aec4d0c1c4464.jpg",
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 10.w,
                children: [
                  Text(
                      "3",
                      style: AppTextStyles.textFtS12FW500.copyWith(
                        color: AppColors.whiteText,
                      )
                  ),
                  Text(
                      "card is valid until 08-11-2029",
                      style: AppTextStyles.textFtS12FW500.copyWith(
                        color: AppColors.whiteText,
                      )
                  ),
                ],
              ).onlyPadding(top: 10.h),
              Spacer(),
              Text(
                  "Bachelor of Science degree in Statistics and Computer Science.",
                  style: AppTextStyles.textFtS12FW500.copyWith(
                    color: AppColors.whiteText,
                  )
              ).sized(horizontal: 200.w),
            ],
          ).symmetricPadding(horizontal: 20.w, vertical: 20.h),
        ],
      ),
    );
  }
}
