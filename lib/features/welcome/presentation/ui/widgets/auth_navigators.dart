import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class AuthNavigators extends StatelessWidget {
  const AuthNavigators({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onTap: (){
            Navigator.pushNamed(context, AppRoutes.loginScreen,);
          },
          width: 207.w,
          decoration: AppBoxDecoration.welcomeButton(AppColors.splashColor),
          label: "Log In",
          padding: EdgeInsets.symmetric(vertical: 10.h,),
          textColor: AppColors.welcomeColor,
        ),
        SizedBox(height: 4.h, width: double.infinity),
        CustomButton(
          onTap: (){
            Navigator.pushNamed(context, AppRoutes.registerScreen,);
          },
          width: 207.w,
          decoration: AppBoxDecoration.welcomeButton(Colors.white),
          label: "Sign Up",
          padding: EdgeInsets.symmetric(vertical: 10.h,),
          textColor: AppColors.welcomeColor,
        ),
      ],
    );
  }
}