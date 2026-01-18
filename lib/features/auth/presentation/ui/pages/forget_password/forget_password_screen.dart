import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import '../../../../../../cores/shared/ui/widgets/screen_layout.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';
import '../../widgets/auth_app_bar.dart';
import 'widget/forget_password_listener.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      resizeToAvoidBottomInset: false,
      appBar: AuthAppBar(screenTitle: "Forget Password"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          spacing: 30.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ForgetPasswordListener()
          ],
        ).scrolling,
      ),
    );
  }
}
