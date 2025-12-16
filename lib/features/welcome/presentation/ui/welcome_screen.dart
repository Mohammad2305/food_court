import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../cores/utils/constants/app_assets.dart';
import '../../../../cores/utils/constants/app_colors.dart';
import 'widgets/auth_navigators.dart';
import 'widgets/welcome_description.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.welcomeColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.welcome),
          SizedBox(height: 28.h,),
          WelcomeDescription(),
          SizedBox(height: 43.h,),
          AuthNavigators(),
        ],
      ),
    );
  }
}
