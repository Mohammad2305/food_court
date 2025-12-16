import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/auth/presentation/ui/pages/login/widgets/login_form.dart';
import 'package:food_court/features/auth/presentation/ui/pages/login/widgets/login_welcome.dart';
import '../../widgets/auth_app_bar.dart';
import '../../widgets/auth_bottom.dart';
import '../../widgets/platforms_signs.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: AuthAppBar(screenTitle: "Log In"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          spacing: 30.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginWelcome(),
            LoginForm(),
            PlatformsSigns(),
            AuthBottom(
              question: "Don’t have an account?",
              answer: "Sign Up",
              screenName: AppRoutes.registerScreen,
            ),
          ],
        ).scrolling,
      ),
    );
  }
}
