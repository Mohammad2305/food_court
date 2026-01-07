import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';

class AdsCenter extends StatelessWidget {
  const AdsCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
      clipBehavior: Clip.antiAlias,
      child: CarouselSlider.builder(
        itemCount: 3,
        options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true
        ),
        itemBuilder: (context, index, i) {
          return Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Experience our delicious new dish",
                    style: AppTextStyles.textFtS17FW500.copyWith(color: AppColors.whiteText),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "30% OFF",
                    style: AppTextStyles.textFtS28FW700.copyWith(color: AppColors.whiteText),
                  )
                ],
              ).sized(horizontal: 150.w).symmetricPadding(horizontal: 13.w),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          AppAssets.imageSample,
                        )
                    )
                ),
              ).sized(horizontal: 145.w),
            ],
          );
        },
      ),
    );
  }
}