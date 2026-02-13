import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../cores/utils/extensions/main_app.dart';
import '../../../../../cores/utils/extensions/strings.dart';
import '../../../../../cores/utils/functions/dates.dart';

class CartItemNameDate extends StatelessWidget {
  final String? name;
  final DateTime? date;
  const CartItemNameDate({super.key, this.name, this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name?.titleCase ?? "Product Name",
          style: AppTextStyles.textFtS15FW500.copyWith(
            color: AppColors.whiteText,
          ),
        ).sized(horizontal: 80.w),
        Text(
          AppDates.foodCourtDateForm(
            date ?? DateTime.now(),
          ),
          style: AppTextStyles.textFtS14FW300.copyWith(
            color: AppColors.whiteText,
          ),
        ).sized(horizontal: 50.w),
      ],
    );
  }
}
