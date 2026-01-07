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
          CustomInput(
            inputTitle: "Full name",
            hintText: "Mohammed Nasser Ali Ahmed",
            inputController: TextEditingController(),
          ),
          PasswordInput(inputController: TextEditingController(),),
          CustomInput(
            inputTitle: "Email",
            hintText: "example@example.com",
            inputController: TextEditingController(),
          ),
          CustomInput(
            inputTitle: "Mobile Number",
            hintText: "+ 123 456 789",
            inputController: TextEditingController(),
          ),
          CustomInput(
            inputTitle: "Date of birth",
            hintText: "DD/MM/YYYY",
            inputController: TextEditingController(),
          ),
          TermsPrivacy(),
          CustomButton(
            onTap: () {},
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            width: 207.w,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            textColor: AppColors.whiteText,
            label: "Sign Up",
          ).centering,
        ],
      ),
    );
  }
}
