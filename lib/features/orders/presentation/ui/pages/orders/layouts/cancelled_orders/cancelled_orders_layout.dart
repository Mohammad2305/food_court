import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/orders/presentation/ui/pages/orders/layouts/cancelled_orders/widgets/cancelled_item_actions.dart';
import 'package:food_court/features/orders/presentation/ui/pages/orders/layouts/completed_orders/widgets/completed_item_actions.dart';
import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../widgets/item_info.dart';
import '../../widgets/order_info.dart';

class CancelledOrdersLayout extends StatelessWidget {
  const CancelledOrdersLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Row(
          spacing: 10.w,
          children: [
            Container(
              height: 105.h,
              decoration: AppBoxDecoration.general(
                AppColors.whiteText,
                10.r,
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                "https://i.pinimg.com/736x/4c/04/f0/4c04f0cb3399d2c2792e14e52cc5ba82.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              spacing: 5.h,
              children: [
                ItemInfo(
                  itemName: "Strawberry shake",
                  itemPrice: 20,
                ),
                OrderInfo(
                  itemCount: 2,
                  dateTime: DateTime.now(),
                ),
                CancelledItemActions(),
              ],
            ).sized(horizontal: 250.w),
          ],
        );
      },
      separatorBuilder: (context, index) => Divider(),
      shrinkWrap: true,
      itemCount: 2,
    );
  }
}
