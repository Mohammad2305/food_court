import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/orders/presentation/ui/pages/orders/layouts/active_orders/widgets/active_item_actions.dart';
import 'package:food_court/features/profile/data/models/user_model.dart';
import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../widgets/empty_list.dart';
import '../../widgets/item_info.dart';
import '../../widgets/order_info.dart';

class ActiveOrdersLayout extends StatelessWidget {
  final UserModel? user;
  const ActiveOrdersLayout({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    debugPrint([].toString());
    return ([]??[]).isEmpty
        ? EmptyList(orderState: 'active',)
        : ListView.separated(
      itemBuilder: (context, index) {
        return Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: Container(
                height: 105.h,
                decoration: AppBoxDecoration.general(
                  AppColors.whiteText,
                  10.r,
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  AppAssets.imageSample,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              spacing: 5.h,
              children: [
                ItemInfo(
                  itemName: "user?.activeOrders[index].productName",
                  itemPrice: 0,
                ),
                OrderInfo(
                  itemCount: 2,
                  dateTime: DateTime.now(),
                ),
                ActiveItemActions(index: index,),
              ],
            ).sized(horizontal: 250.w),
          ],
        );
      },
      separatorBuilder: (context, index) => Divider(),
      shrinkWrap: true,
      itemCount: 1,
    );
  }
}
