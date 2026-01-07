import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../cores/shared/ui/widgets/custom_input.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class EditAccountInfoForm extends StatelessWidget {
  const EditAccountInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            spacing: 30.h,
            children: [
              CustomInput(
                inputTitle: "Full Name",
                hintText: "Mohammed Nasser Ali Ahmed Fadl",
                inputController: TextEditingController(),
              ),
              CustomInput(
                inputTitle: "Date of Birth",
                hintText: "DD/MM/YYYY",
                inputController: TextEditingController(),
              ),
              CustomInput(
                inputTitle: "Email",
                hintText: "example@example.com",
                inputController: TextEditingController(),
              ),
              CustomInput(
                inputTitle: "Phone Number",
                hintText: "+123 567 89000",
                inputController: TextEditingController(),
              ),
            ],
          ),
        ),
        CustomButton(
          onTap: () {
            debugPrint("Update Profile");
          },
          decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
          label: "Update Profile",
          width: 145.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          textColor: AppColors.whiteText,
        ).onlyPadding(top: 35.h),
      ],
    );
  }
}
