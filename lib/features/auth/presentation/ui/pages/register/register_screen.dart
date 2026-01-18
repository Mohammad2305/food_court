import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/auth/presentation/ui/pages/register/widgets/register_bloc_listener.dart';
import '../../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';
import '../../widgets/auth_app_bar.dart';
import '../../widgets/auth_bottom.dart';
import '../../widgets/platforms_signs.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: AuthAppBar(screenTitle: "New Account"),
      resizeToAvoidBottomInset: false,
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RegisterBlocListener(),
            const PlatformsSigns().onlyPadding(bottom: 9.h),
            const AuthBottom(
              question: "Already have an account?",
              answer: "Log in",
              screenName: AppRoutes.loginScreen,
            ),
          ],
        ).scrolling,
      ),
    );
  }
}
