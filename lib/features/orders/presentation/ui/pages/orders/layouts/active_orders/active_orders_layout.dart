import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/orders/presentation/manager/orders_cubit.dart';
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
    return (user?.activeOrders??[]).isEmpty
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
                  user?.activeOrders[index].productImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              spacing: 5.h,
              children: [
                ItemInfo(
                  itemName: context.read<OrdersCubit>().active![index].productName,
                  itemPrice: context.read<OrdersCubit>().active![index].productPrice,
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
      itemCount: context.read<OrdersCubit>().active!.length,
    );
  }
}
