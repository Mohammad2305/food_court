import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import 'action_item.dart';

class MenuHead extends StatelessWidget {
  const MenuHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          children: [
            SizedBox(
              width: 200.w,
              height: 30.h,
              child: SearchBar(
                trailing: {
                  CircleAvatar(
                    radius: 10.r,
                    backgroundColor: AppColors.welcomeColor,
                    child: SvgPicture.asset(AppAssets.searchIcon),
                  ),
                },
              ),
            ),
            Spacer(),
            ActionItem(
              iconPath: AppAssets.cartIcon,
              onTap: (){},
            ),
            ActionItem(
              iconPath: AppAssets.notificationIcon,
              onTap: (){},
            ),
            ActionItem(
              iconPath: AppAssets.profileIcon,
              onTap: (){
                Navigator.pushNamed(context, AppRoutes.profileScreen);
              },
            ),
          ],
        ).onlyPadding(bottom: 16.h),
      ],
    ).symmetricPadding(horizontal: 36.w);
  }
}
