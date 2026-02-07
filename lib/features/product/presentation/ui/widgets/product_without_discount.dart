import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ProductWithoutDiscount extends StatelessWidget {
  final double? productPrice;

  const ProductWithoutDiscount({super.key, this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "\$${((productPrice ?? 0)).toStringAsFixed(2)}",
          style: AppTextStyles.textFtS24FW600.copyWith(
            color: AppColors.welcomeColor,
          ),
        ),
      ],
    );
  }
}
