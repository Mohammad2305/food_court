import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/onboarding/presentation/ui/widgets/jump_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../data/models/onboarding_page.dart';

class TextContainer extends StatelessWidget {
  final PageController pageController;
  final int currentIndex;

  const TextContainer({
    super.key,
    required this.pageController,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 60.w),
      decoration: AppBoxDecoration.welcomeButton(AppColors.whiteText),
      height: 338.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            onboarding[currentIndex].pageIcon,
            height: 35.h,
          ).onlyPadding(bottom: 20.19.h),
          Text(
            onboarding[currentIndex].pageTitle,
            style: AppTextStyles.textFtS24FW900.copyWith(
              color: AppColors.welcomeColor,
            ),
          ).onlyPadding(bottom: 19.h),
          Text(
            onboarding[currentIndex].pageDescription,
            style: AppTextStyles.textFtS14FW500,
            textAlign: TextAlign.center,
          ).onlyPadding(bottom: 45.h),
          SmoothPageIndicator(
            controller: pageController,
            count: onboarding.length,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.welcomeColor,
              dotHeight: 10.h,
              dotWidth: 10.w,
              dotColor: AppColors.splashColor,
            ),
          ).onlyPadding(bottom: 23.h),
          JumpButton(pageController: pageController, currentIndex: currentIndex),
        ],
      ),
    ).bottomAligning;
  }
}
