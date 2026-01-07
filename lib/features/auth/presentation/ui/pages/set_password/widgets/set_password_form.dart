import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../widgets/password_input.dart';

class SetPasswordForm extends StatelessWidget {
  const SetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> setPasswordKey = GlobalKey();
    return Form(
      key: setPasswordKey,
      child: Column(
        spacing: 8.h,
        children: [
          PasswordInput(inputController: TextEditingController()),
          PasswordInput(
            inputTitle: "Confirm",
            inputController: TextEditingController(),
          ).onlyPadding(bottom: 50.h),
          CustomButton(
            onTap: () {},
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            width: 207.w,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            textColor: AppColors.whiteText,
            label: "Create",
          ).centering,
        ],
      ),
    );
  }
}
