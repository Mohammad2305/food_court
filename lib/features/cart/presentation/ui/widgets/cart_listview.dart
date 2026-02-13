import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/cart/data/models/order_model.dart';
import 'package:food_court/features/cart/presentation/ui/widgets/cart_item.dart';
import 'package:food_court/features/profile/presentation/manager/profile_data_cubit.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class CartListview extends StatelessWidget {
  final List<OrderModel>? cart;

  const CartListview({super.key, this.cart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: cart?.length ?? 0,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            itemBuilder: (context, index) {
              return CartItem(order: cart?[index]);
            },
            separatorBuilder: (context, index) => Divider(
              color: AppColors.whiteText,
            ).symmetricPadding(vertical: 10.h),
          ),
        ),
        Column(
          spacing: 10.h,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: AppTextStyles.textFtS20FW500.copyWith(
                    color: AppColors.whiteText,
                  ),
                ),
                Text(
                  "\$${context.read<ProfileDataCubit>().totalOrderPrice(orders: cart).toStringAsFixed(2)}",
                  style: AppTextStyles.textFtS20FW500.copyWith(
                    color: AppColors.whiteText,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tax and Fees",
                  style: AppTextStyles.textFtS20FW500.copyWith(
                    color: AppColors.whiteText,
                  ),
                ),
                Text(
                  "\$5.00",
                  style: AppTextStyles.textFtS20FW500.copyWith(
                    color: AppColors.whiteText,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: AppTextStyles.textFtS20FW500.copyWith(
                    color: AppColors.whiteText,
                  ),
                ),
                Text(
                  "\$3.00",
                  style: AppTextStyles.textFtS20FW500.copyWith(
                    color: AppColors.whiteText,
                  ),
                ),
              ],
            ),
            Divider(color: AppColors.whiteText,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: AppTextStyles.textFtS20FW500.copyWith(
                    color: AppColors.whiteText,
                  ),
                ),
                Text(
                  "\$${(context.read<ProfileDataCubit>().totalOrderPrice(orders: cart)+5+3).toStringAsFixed(2)}",
                  style: AppTextStyles.textFtS20FW500.copyWith(
                    color: AppColors.whiteText,
                  ),
                ),
              ],
            ),
          ],
        ).symmetricPadding(horizontal: 30.w, vertical: 30.h),
      ],
    );
  }
}
