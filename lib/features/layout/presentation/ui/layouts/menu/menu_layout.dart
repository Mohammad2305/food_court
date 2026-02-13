import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';

import '../../widgets/menu_head.dart';

class MenuLayout extends StatelessWidget {
  const MenuLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuHead(),
        ScreenLayout(
          height: 750.h,
          screenLayoutColor: AppColors.welcomeColor,
          child: ScreenLayout(
            padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
            height: 650.h,
            child: SingleChildScrollView(
              child: Column(
                spacing: 30.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
