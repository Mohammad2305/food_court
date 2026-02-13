import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/features/cart/data/models/order_model.dart';
import 'package:food_court/features/cart/presentation/ui/widgets/cart_item_name_date.dart';
import 'package:food_court/features/cart/presentation/ui/widgets/cart_item_price_amount.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../cores/utils/extensions/main_app.dart';

class CartItem extends StatelessWidget {
  final OrderModel? order;
  const CartItem({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 105.h,
            decoration: AppBoxDecoration.general(AppColors.whiteText, 10.r),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              order?.product.productImage ?? AppAssets.imageSample,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5.h,
            children: [
              CartItemNameDate(name: order?.product.productName, date: order?.dateTime,),
              CartItemPriceAmount(product: order?.product, amount: order?.amount,),
            ],
          ).sized(horizontal: 250.w),
        ),
      ],
    );
  }
}
