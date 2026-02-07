import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ProductImageDiscount extends StatelessWidget {
  final int? productDiscount;
  final String? productImage;

  const ProductImageDiscount({
    super.key,
    this.productDiscount,
    this.productImage,
  });

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
            productImage ?? AppAssets.imageSample,
            fit: BoxFit.cover,
          ),
        ),
        (productDiscount ?? 0) > 0
            ? Positioned(
                right: -20.w,
                top: -20.h,
                child: Container(
                  decoration: AppBoxDecoration.welcomeButton(
                    AppColors.welcomeColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    "-$productDiscount%",
                    style: AppTextStyles.textFtS20FW500.copyWith(
                      color: AppColors.whiteText,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
        Positioned(
          left: 10.w,
          bottom: 10.h,
          child: Container(
            decoration: AppBoxDecoration.welcomeButton(AppColors.whiteText),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border, color: AppColors.welcomeColor, size: 25.sp,),
            ),
          ),
        ),
      ],
    );
  }
}
