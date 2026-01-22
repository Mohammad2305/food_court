import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';

class BestSellerItem extends StatelessWidget {
  final ProductModel? productModel;

  const BestSellerItem({super.key, this.productModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: AppBoxDecoration.welcomeButton(AppColors.splashColor),
          clipBehavior: Clip.hardEdge,
          width: 75.w,
          height: 110.h,
          child: productModel?.productImage == null
              ? Icon(Icons.image_not_supported)
              : Image.network(
                  productModel?.productImage ?? AppAssets.imageSample,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          right: -1.w,
          bottom: 20.h,
          child: Container(
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
            child: Text(
              "\$${(productModel?.productPrice)?.toStringAsFixed(2) ?? 00.00}",
              style: AppTextStyles.textFtS12FW500.copyWith(
                color: AppColors.whiteText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
