import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../cores/utils/constants/app_assets.dart';
import '../../../../cores/utils/constants/app_colors.dart';
import 'widgets/auth_navigators.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.welcomeColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.welcome).onlyPadding(bottom: 28.h),
          Text(
            "Delicious meals are just a tap away. Let’s find something tasty for you today!",
            style: AppTextStyles.textFtS14FW500.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ).sized(horizontal: 295.w).onlyPadding(bottom: 43.h),
          const AuthNavigators(),
        ],
      ),
    );
  }
}
