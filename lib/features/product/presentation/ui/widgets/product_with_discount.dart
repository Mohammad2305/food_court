import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ProductWithDiscount extends StatelessWidget {
  final double? productDiscount;
  final double? productPrice;

  const ProductWithDiscount({
    super.key,
    this.productDiscount,
    this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "\$${((productPrice ?? 0) * (100 - (productDiscount ?? 0)) / 100).toStringAsFixed(2)}",
          style: AppTextStyles.textFtS24FW600.copyWith(
            color: AppColors.welcomeColor,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          "\$${((productPrice ?? 0)).toStringAsFixed(2)}",
          style: AppTextStyles.textFtS17FW500.copyWith(
            color: AppColors.splashColor,
            decoration: TextDecoration.lineThrough,
            decorationColor: AppColors.welcomeColor,
          ),
        ),
      ],
    );
  }
}
