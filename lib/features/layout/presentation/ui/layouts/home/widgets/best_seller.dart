import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Best Seller", style: AppTextStyles.textFtS20FW500),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "View All",
                    style: AppTextStyles.textFtS12FW500.copyWith(
                      color: AppColors.welcomeColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.welcomeColor,
                    size: 15.r,
                  ),
                ],
              ),
            ),
          ],
        ),
        ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              decoration: AppBoxDecoration.welcomeButton(AppColors.splashColor),
              clipBehavior: Clip.hardEdge,
              width: 75.w,
              height: 110.h,
              child: Image.network(
                AppAssets.imageSample,
                fit: BoxFit.cover,
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 6.w),
        ).sized(vertical: 120.h),
      ],
    );
  }
}