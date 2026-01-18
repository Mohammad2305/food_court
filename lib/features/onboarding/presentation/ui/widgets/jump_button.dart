import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../data/models/onboarding_page.dart';

class JumpButton extends StatelessWidget {
  final PageController pageController;
  final int currentIndex;
  const JumpButton({super.key, required this.pageController, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (currentIndex < onboarding.length - 1) {
          pageController.animateToPage(
            currentIndex + 1,
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        }
        else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.welcomeScreen,
                (_) => false,
          );
        }
      },
      decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
      textColor: AppColors.whiteText,
      padding: EdgeInsets.symmetric(horizontal: (49.5).w, vertical: 8.h),
      label: currentIndex == onboarding.length - 1
          ? "Get Started"
          : "Next",
    );
  }
}
