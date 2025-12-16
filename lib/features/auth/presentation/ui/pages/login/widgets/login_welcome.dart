import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';

class LoginWelcome extends StatelessWidget {
  const LoginWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome", style: AppTextStyles.textFtS24FW600).onlyPadding(bottom: 8.h),
        Text(
          "Log in to explore restaurants, place your order, and enjoy fast delivery.",
          style: AppTextStyles.textFtS14FW300,
        ),
      ],
    );
  }
}
