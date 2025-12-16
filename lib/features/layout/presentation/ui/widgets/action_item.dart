import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ActionItem extends StatelessWidget {
  final String iconPath;
  final void Function()? onTap;
  const ActionItem({super.key, required this.iconPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 26.w,
        height: 26.h,
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        decoration: AppBoxDecoration.welcomeButton(AppColors.whiteText),
        child: SvgPicture.asset(iconPath, width: 16.w, height: 16.h,),
      ),
    );
  }
}
