import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import '../../../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_input.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../widgets/password_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginKey = GlobalKey();
    return Form(
      key: loginKey,
      child: Column(
        spacing: 8.h,
        children: [
          CustomInput(
            inputTitle: "Email or Mobile Number",
            hintText: "example@example.com",
            inputController: TextEditingController(),
          ),
          PasswordInput(inputController: TextEditingController(),),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.setPasswordScreen);
            },
            child: Text(
              "forget password",
              style: AppTextStyles.textFtS14FW500.copyWith(
                color: AppColors.welcomeColor,
              ),
            ),
          ).rightAligning,
          CustomButton(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.layoutScreen, (_)=>false);
            },
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            width: 207.w,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            textColor: AppColors.whiteText,
            label: "Log In",
          ).centering,
        ],
      ),
    );
  }
}
