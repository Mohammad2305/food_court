import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../../layout/data/models/product_model.dart';

class ProductNameStars extends StatelessWidget {
  final ProductModel? product;
  const ProductNameStars({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            product?.productName.titleCase ?? "Product Name",
            style: AppTextStyles.textFtS12FW500,
          ),
        ),
        Container(
          decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Row(
            spacing: 1.w,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${product?.productStars ?? "5.0"}",
                style: AppTextStyles.textFtS12FW500.copyWith(color: AppColors.whiteText),
              ),
              SvgPicture.asset(
                AppAssets.filledStar,
                colorFilter: ColorFilter.mode(
                  AppColors.splashColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
