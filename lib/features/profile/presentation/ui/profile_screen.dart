import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/profile/presentation/ui/widgets/profile_details_listview.dart';
import 'package:food_court/features/profile/presentation/ui/widgets/profile_info_listener.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.welcomeColor,
      body: Column(
        children: [
          ProfileInfoListener(),
          ProfileDetailsListview(),
        ],
      ).symmetricPadding(horizontal: 30.w,).onlyPadding(top: 34.h),
    );
  }
}
