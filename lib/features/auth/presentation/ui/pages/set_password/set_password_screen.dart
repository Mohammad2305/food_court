import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/features/auth/presentation/ui/pages/set_password/widgets/set_password_listener.dart';
import '../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';
import '../../widgets/auth_app_bar.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(screenTitle: "Set Password"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30.h,
          children: [
            Text(
              "Set a strong, unique password to ensure your account stays protected. Use a mix of letters, numbers, and symbols for maximum security.",
              style: AppTextStyles.textFtS14FW300,
            ),
            SetPasswordListener()
          ],
        ),
      ),
    );
  }
}
