import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/cart/data/models/order_model.dart';
import 'package:food_court/features/cart/presentation/ui/widgets/cart_item_name_date.dart';
import 'package:food_court/features/cart/presentation/ui/widgets/cart_item_price_amount.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../cores/utils/extensions/main_app.dart';

class CartItemPriceAmount extends StatelessWidget {
  final ProductModel? product;
  final int? amount;
  const CartItemPriceAmount({super.key, this.product, this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$${product?.productPrice}",
          style: AppTextStyles.textFtS14FW300.copyWith(
            color: AppColors.whiteText,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.productScreen,
                      (_) => false,
                  arguments: product,
                );
              },
              icon: Icon(Icons.edit, color: AppColors.whiteText),
            ),
            Text(
              "$amount item",
              style: AppTextStyles.textFtS14FW300.copyWith(
                color: AppColors.whiteText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
