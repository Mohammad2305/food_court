import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(1.w,1.h),
      children: [
        Container(
          width: 130.w,
          height: 130.h,
          decoration: AppBoxDecoration.welcomeButton(AppColors.whiteText),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            "https://i.pinimg.com/1200x/22/a3/9e/22a39eaccc40ef068c6d060bbc77e8c7.jpg",
            fit: BoxFit.cover,
          ),
        ),
        InkWell(
          onTap: (){debugPrint("select image from gallery or camera");},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            decoration: AppBoxDecoration.general(AppColors.welcomeColor, 10.r),
            clipBehavior: Clip.hardEdge,
            child: SvgPicture.asset(
              AppAssets.camera,
              width: 20.w,
              colorFilter: ColorFilter.mode(AppColors.whiteText, BlendMode.srcIn),
            ),
          ),
        ),
      ],
    ).onlyPadding(bottom: 35.h);
  }
}
