import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/features/auth/presentation/ui/pages/finger_print_set/widgets/actions.dart';
import '../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';
import '../../widgets/auth_app_bar.dart';

class FingerPrintSetScreen extends StatelessWidget {
  const FingerPrintSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: AuthAppBar(screenTitle: "Set Your Fingerprint"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Secure your account by setting up fingerprint authentication for instant and safe login.",
              style: AppTextStyles.textFtS14FW300,
            ),
            Center(child: SvgPicture.asset(AppAssets.fingerPrintGreyBig)),
            FingerPrintSetActions(),
          ],
        ),
      ),
    );
  }
}