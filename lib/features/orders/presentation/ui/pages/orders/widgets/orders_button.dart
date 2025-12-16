import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';

class OrdersButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final Color backgroundColor;
  final Color textColor;

  const OrdersButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTap,
      decoration: AppBoxDecoration.welcomeButton(backgroundColor),
      label: title,
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 12.w),
      textStyle: AppTextStyles.textFtS15FW500,
      textColor: textColor,
    );
  }
}
