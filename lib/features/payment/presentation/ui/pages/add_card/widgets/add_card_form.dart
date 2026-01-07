import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_input.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';

class AddCardForm extends StatelessWidget {
  const AddCardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 30.h,
        children: [
          CustomInput(
            inputTitle: "Card holder name",
            hintText: "Mohammed Nasser Ali Ahmed",
            inputController: TextEditingController(),
          ),
          CustomInput(
            inputTitle: "Card Number",
            hintText: "000 000 000 00",
            inputController: TextEditingController(),
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: CustomInput(
                  inputTitle: "Expiry date",
                  hintText: "MM/YY",
                  inputController: TextEditingController(),
                ),
              ),
              Expanded(
                child: CustomInput(
                  inputTitle: "CVV",
                  hintText: "0000",
                  inputController: TextEditingController(),
                ),
              ),
            ],
          ),
          CustomButton(
            onTap: () {
              debugPrint("Save Card");
            },
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            width: 150.w,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            textColor: AppColors.whiteText,
            label: "Save Card",
          ).onlyPadding(top: 25.h),
        ],
      ),
    ).onlyPadding(top: 35.h);
  }
}
