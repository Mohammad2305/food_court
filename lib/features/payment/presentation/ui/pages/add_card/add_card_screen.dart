import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_input.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/payment/presentation/ui/pages/add_card/widgets/bank_card.dart';
import '../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../cores/shared/ui/widgets/general_app_bar.dart';
import '../../../../../../cores/shared/ui/widgets/screen_layout.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: GeneralAppBar(screenTitle: "Add Card",),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          children: [
            BankCard(),
            Form(
              child: Column(
                spacing: 30.h,
                children: [
                  CustomInput(inputTitle: "Card holder name",),
                  CustomInput(inputTitle: "Card Number",),
                  Row(
                    spacing: 10.w,
                    children: [
                      Expanded(child: CustomInput(inputTitle: "Expiry date",)),
                      Expanded(child: CustomInput(inputTitle: "CVV",)),
                    ],
                  ),
                  CustomButton(
                    onTap: () {debugPrint("Save Card");},
                    decoration: AppBoxDecoration.welcomeButton(
                      AppColors.welcomeColor,
                    ),
                    width: 150.w,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    textColor: AppColors.whiteText,
                    label: "Save Card",
                  ).onlyPadding(top: 25.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
