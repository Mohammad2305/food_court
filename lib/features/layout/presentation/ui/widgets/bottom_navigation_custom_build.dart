import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class BottomNavigationCustomBuild extends StatelessWidget {
  final void Function(int index) onTap;
  final int currentIndex;

  const BottomNavigationCustomBuild({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width/((AppAssets.navigators.length)*3);
    return Container(
      decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
      height: 80.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: (width/2.5).w),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: AppAssets.navigators.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onTap(index);
            },
            child: Container(
              width: (width*2).w,
              decoration: AppBoxDecoration.welcomeButton(
                AppColors.splashColor.withAlpha(
                  index == currentIndex ? 1000 : 100,
                ),
              ),
              child: SvgPicture.asset(
                AppAssets.navigators[index],
                width: 23.w,
                colorFilter: ColorFilter.mode(
                  AppColors.whiteText,
                  BlendMode.srcIn,
                ),
              ).symmetricPadding(vertical: 10.h),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: (width/2.5).w),
      ),
    ).bottomAligning;
  }
}
