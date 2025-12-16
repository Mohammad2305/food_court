import 'package:flutter/material.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import '../../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../widgets/orders_button.dart';

class CompletedItemActions extends StatelessWidget {
  final int index;
  const CompletedItemActions({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        OrdersButton(
          title: "Leave a review",
          onTap: (){
            Navigator.pushNamed(context, AppRoutes.orderReviewScreen);
          },
          backgroundColor: AppColors.welcomeColor,
          textColor: AppColors.whiteText,
        ),
        OrdersButton(
          title: "Order Again",
          onTap: (){
            debugPrint("$index ordered");
          },
          backgroundColor: AppColors.welcomeColor.withAlpha(100),
          textColor: AppColors.welcomeColor,
        ),
      ],
    );
  }
}
