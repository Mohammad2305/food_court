import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_input.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';

class NewAddressForm extends StatelessWidget {
  const NewAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 30.h,
        children: [
          CustomInput(inputTitle: "Name",),
          CustomInput(inputTitle: "Address",),
          CustomButton(
            onTap: () {debugPrint("add new address");},
            decoration: AppBoxDecoration.welcomeButton(
              AppColors.welcomeColor,
            ),
            width: 150.w,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            textColor: AppColors.whiteText,
            label: "Apply",
          ).onlyPadding(top: 110.h),
        ],
      ),
    );
  }
}
