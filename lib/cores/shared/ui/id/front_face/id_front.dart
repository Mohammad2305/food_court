import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../themes/app_boxes_decoration.dart';
import '../../../themes/app_text_styles.dart';

class IdFront extends StatelessWidget {
  const IdFront({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
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
                  decoration: AppBoxDecoration.general(Colors.black, 0),
                )
              ],
            ),
          ).rightAligning.onlyPadding(right: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mohammed",
                          style: AppTextStyles.textFtS15FW500.copyWith(
                            color: AppColors.whiteText,
                          ),
                        ),
                        Text(
                          "Nasser Ali Ahmed Fadl",
                          style: AppTextStyles.textFtS15FW500.copyWith(
                            color: AppColors.whiteText,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          "Sh. Talaat Harb - Manshiet El Zahraa",
                          style: AppTextStyles.textFtS15FW500.copyWith(
                            color: AppColors.whiteText,
                          ),
                        ),
                        Text(
                          "Mahalla First - Gharbia",
                          style: AppTextStyles.textFtS15FW500.copyWith(
                            color: AppColors.whiteText,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                      ],
                    ),
                  ),
                  Container(
                    decoration: AppBoxDecoration.general(
                      AppColors.whiteText,
                      20.r,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 3.h,
                      horizontal: 3.w,
                    ),
                    child: Center(
                      child: Container(
                        decoration: AppBoxDecoration.general(
                          Colors.white,
                          18.r,
                        ),
                        width: 80.w,
                        height: 80.h,
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          "https://i.pinimg.com/1200x/22/a3/9e/22a39eaccc40ef068c6d060bbc77e8c7.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "3 00 05 23 16 003 33",
                    style: AppTextStyles.textFtS15FW500.copyWith(
                      color: AppColors.whiteText,
                    ),
                  ),
                  Container(
                    decoration: AppBoxDecoration.general(Colors.black54, 5.r),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Text(
                      "23-05-2000",
                      style: AppTextStyles.textFtS15FW500.copyWith(
                        color: AppColors.whiteText,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ).symmetricPadding(horizontal: 20.w, vertical: 20.h),
        ],
      ),
    );
  }
}
