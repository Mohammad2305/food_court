import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';

class PlatformsSigns extends StatelessWidget {
  const PlatformsSigns({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: Divider(color: AppColors.splashColor, thickness: 2),
            ),
            Text("Sign Up", style: AppTextStyles.textFtS14FW300),
            Expanded(
              child: Divider(color: AppColors.splashColor, thickness: 2),
            ),
          ],
        ),
        Row(
          spacing: 9.19.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){debugPrint("Google Auth");},
              child: CircleAvatar(
                backgroundColor: AppColors.iconCircle,
                child: SvgPicture.asset(AppAssets.gmailIcon),
              ),
            ),
            InkWell(
              onTap: (){debugPrint("Facebook Auth");},
              child: CircleAvatar(
                backgroundColor: AppColors.iconCircle,
                child: SvgPicture.asset(AppAssets.facebookIcon),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, AppRoutes.setFingerPrintScreen);
              },
              child: CircleAvatar(
                backgroundColor: AppColors.iconCircle,
                child: SvgPicture.asset(AppAssets.fingerPrintIcon),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
