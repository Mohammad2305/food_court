import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/product/presentation/ui/widgets/loved_bloc_builder.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../../layout/data/models/product_model.dart';

class ProductImageDiscount extends StatelessWidget {
  final ProductModel? product;

  const ProductImageDiscount({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
          width: double.infinity,
          height: 220.h,
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            product?.productImage ?? AppAssets.imageSample,
            fit: BoxFit.cover,
          ),
        ),
        (product?.productDiscount ?? 0) > 0
            ? Positioned(
                right: -20.w,
                top: -20.h,
                child: Container(
                  decoration: AppBoxDecoration.welcomeButton(
                    AppColors.welcomeColor,
                  ),
                  child: Text(
                    "-${product?.productDiscount}%",
                    style: AppTextStyles.textFtS20FW500.copyWith(
                      color: AppColors.whiteText,
                    ),
                  ).symmetricPadding(horizontal: 10.w, vertical: 10.h),
                ),
              )
            : SizedBox.shrink(),
        LovedBlocBuilder(product: product,),
        Positioned(
          right: 10.w,
          bottom: 10.h,
          child: Container(
            decoration: AppBoxDecoration.welcomeButton(AppColors.whiteText),
            child: Row(
              spacing: 10.w,
              children: [
                Text(
                  (product?.productStars).toString(),
                  style: AppTextStyles.textFtS17FW500,
                ),
                SvgPicture.asset(
                  AppAssets.filledStar,
                  width: 20.w,
                  colorFilter: ColorFilter.mode(
                    AppColors.welcomeColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ).symmetricPadding(horizontal: 10.w, vertical: 10.h),
          ),
        ),
      ],
    );
  }
}
