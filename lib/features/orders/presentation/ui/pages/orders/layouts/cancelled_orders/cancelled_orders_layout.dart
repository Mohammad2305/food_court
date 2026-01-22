import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../manager/orders_cubit.dart';
import '../../widgets/empty_list.dart';
import '../../widgets/item_info.dart';
import '../../widgets/order_info.dart';
import 'widgets/cancelled_item_actions.dart';

class CancelledOrdersLayout extends StatelessWidget {
  const CancelledOrdersLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return context.read<OrdersCubit>().cancelled!.isEmpty
        ? EmptyList(orderState: 'cancelled',)
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
                            .cancelled![index]
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
                            .cancelled![index]
                            .productName,
                        itemPrice: 20,
                      ),
                      OrderInfo(
                        itemCount: context
                            .read<OrdersCubit>()
                            .cancelled![index]
                            .productPrice,
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
