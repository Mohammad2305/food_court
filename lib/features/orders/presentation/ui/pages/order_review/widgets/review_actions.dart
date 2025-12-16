import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';

class ReviewActions extends StatelessWidget {
  const ReviewActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        Expanded(
          child: CustomButton(
            onTap: () {},
            decoration: AppBoxDecoration.welcomeButton(
              AppColors.welcomeColor.withAlpha(100),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 45.w),
            textColor: AppColors.welcomeColor,
            label: "cancel".firstCharacterUpper,
          ),
        ),
        Expanded(
          child: CustomButton(
            onTap: () {},
            decoration: AppBoxDecoration.welcomeButton(
              AppColors.welcomeColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 45.w),
            textColor: AppColors.whiteText,
            label: "submit".firstCharacterUpper,
          ),
        )
      ],
    );
  }
}
