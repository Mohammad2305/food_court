import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/orders/presentation/ui/pages/orders/layouts/completed_orders/widgets/completed_item_actions.dart';
import 'package:food_court/features/orders/presentation/ui/pages/orders/widgets/empty_list.dart';
import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../manager/orders_cubit.dart';
import '../../widgets/item_info.dart';
import '../../widgets/order_info.dart';

class CompletedOrdersLayout extends StatelessWidget {
  const CompletedOrdersLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return context.read<OrdersCubit>().active!.isEmpty
        ? EmptyList(orderState: 'completed',)
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
                        context
                            .read<OrdersCubit>()
                            .completed![index]
                            .productImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    spacing: 5.h,
                    children: [
                      ItemInfo(
                        itemName: context
                            .read<OrdersCubit>()
                            .completed![index]
                            .productName,
                        itemPrice: context
                            .read<OrdersCubit>()
                            .completed![index]
                            .productPrice,
                      ),
                      OrderInfo(itemCount: 2, dateTime: DateTime.now()),
                      CompletedItemActions(index: index),
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
