import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_input.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../widgets/password_input.dart';
import 'terms_privacy.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> registerKey = GlobalKey();
    return Form(
      key: registerKey,
      child: Column(
        spacing: 8.h,
        children: [
          CustomInput(inputTitle: "Full name"),
          PasswordInput(),
          CustomInput(inputTitle: "Email"),
          CustomInput(inputTitle: "Mobile Number"),
          CustomInput(inputTitle: "Date of birth"),
          TermsPrivacy(),
          CustomButton(
            onTap: () {},
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            width: 207.w,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            textColor: AppColors.whiteText,
            label: "Sign Up",
          ).centering,
        ]
      ),
    );
  }
}
