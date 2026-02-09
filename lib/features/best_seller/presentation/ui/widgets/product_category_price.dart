import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_court/cores/shared/themes/app_boxes_decoration.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/layout/data/models/food_category_model.dart';
import '../../../../../cores/utils/extensions/aligns.dart';
import '../../../../../cores/utils/extensions/paddings.dart';
import '../../../../layout/data/models/product_model.dart';

class ProductCategoryPrice extends StatelessWidget {
  final ProductModel? product;
  final FoodCategoryModel categoryModel;
  const ProductCategoryPrice({super.key, this.product, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: AppBoxDecoration.welcomeButton(AppColors.whiteText),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: SvgPicture.asset(
            categoryModel.icon,
            width: 18.w,
            height: 20.h,
          ),
        ).leftAligning,
        Container(
          decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Text(
            "\$${product?.productPrice.toStringAsFixed(2) ?? 0.0}",
            style: AppTextStyles.textFtS12FW500.copyWith(
              color: AppColors.whiteText,
            ),
          ),
        ).rightAligning,
      ],
    ).sized(vertical: 130.h).symmetricPadding(vertical: 10.h, horizontal: 10.w);
  }
}
