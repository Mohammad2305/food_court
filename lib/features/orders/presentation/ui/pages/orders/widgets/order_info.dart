import 'package:flutter/material.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/functions/dates.dart';

class OrderInfo extends StatelessWidget {
  final DateTime dateTime;
  final int itemCount;
  const OrderInfo({super.key, required this.dateTime, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppDates.foodCourtDateForm(dateTime),
          style: AppTextStyles.textFtS14FW300,
        ),
        Text(
          "$itemCount items",
          style: AppTextStyles.textFtS14FW300,
        ),
      ],
    );
  }
}
