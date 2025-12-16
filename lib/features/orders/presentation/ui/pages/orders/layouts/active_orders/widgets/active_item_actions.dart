import 'package:flutter/material.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import '../../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../widgets/orders_button.dart';

class ActiveItemActions extends StatelessWidget {
  final int index;
  const ActiveItemActions({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        OrdersButton(
          title: "Cancel Order",
          onTap: (){
            Navigator.pushNamed(context, AppRoutes.cancelOrdersScreen);
          },
          backgroundColor: AppColors.welcomeColor,
          textColor: AppColors.whiteText,
        ),
        OrdersButton(
          title: "Track Driver",
          onTap: (){
            debugPrint("$index tracked");
          },
          backgroundColor: AppColors.welcomeColor.withAlpha(100),
          textColor: AppColors.welcomeColor,
        ),
      ],
    );
  }
}
