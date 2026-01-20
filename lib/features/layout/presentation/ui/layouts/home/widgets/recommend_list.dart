import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';

import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';

class RecommendList extends StatelessWidget {
  const RecommendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "recommend".firstCharacterUpper,
          style: AppTextStyles.textFtS20FW500,
        ),
        GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 140.h,
            crossAxisSpacing: 9.w,
            mainAxisSpacing: 9.h,
          ),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  decoration: AppBoxDecoration.welcomeButton(
                    AppColors.splashColor,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    AppAssets.imageSample,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 5.w,
                      children: [
                        Container(
                          decoration: AppBoxDecoration.welcomeButton(
                            AppColors.whiteText,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 5.w,
                          ),
                          child: Row(
                            spacing: 1.w,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("5.0", style: AppTextStyles.textFtS12FW500),
                              SvgPicture.asset(
                                AppAssets.filledStar,
                                colorFilter: ColorFilter.mode(
                                  AppColors.splashColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: AppBoxDecoration.welcomeButton(
                            AppColors.whiteText,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 5.w,
                          ),
                          child: Icon(Icons.favorite, color: AppColors.welcomeColor, size: 15.sp,),
                        ),
                      ],
                    ).symmetricPadding(horizontal: 10.w),
                    Container(
                      decoration: AppBoxDecoration.welcomeButton(
                        AppColors.welcomeColor,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 2.h,
                        horizontal: 5.w,
                      ),
                      child: Text(
                        "\$50.00",
                        style: AppTextStyles.textFtS12FW500.copyWith(
                          color: AppColors.whiteText,
                        ),
                      ),
                    ).rightAligning,
                  ],
                ).symmetricPadding(vertical: 10.h,),
              ],
            );
          },
        ),
      ],
    );
  }
}
