import 'package:flutter/material.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';

class ItemInfo extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  const ItemInfo({super.key, required this.itemName, required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemName,
          style: AppTextStyles.textFtS17FW500,
        ),
        Text(
          "${itemPrice.toStringAsFixed(2)}\$",
          style: AppTextStyles.textFtS17FW500
              .copyWith(
            color: AppColors.welcomeColor,
          ),
        ),
      ],
    );
  }
}
