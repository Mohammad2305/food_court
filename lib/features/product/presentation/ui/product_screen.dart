import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_court/cores/shared/themes/app_boxes_decoration.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_button.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/product/presentation/ui/widgets/change_amount.dart';
import 'package:food_court/features/product/presentation/ui/widgets/product_image_discount.dart';
import 'package:food_court/features/product/presentation/ui/widgets/product_price.dart';
import 'package:food_court/features/product/presentation/ui/widgets/product_with_discount.dart';
import 'package:food_court/features/product/presentation/ui/widgets/product_without_discount.dart';
import '../../../../cores/shared/ui/widgets/general_app_bar.dart';
import '../../../../cores/shared/ui/widgets/screen_layout.dart';
import '../../../../cores/utils/constants/app_colors.dart';
import '../../../layout/data/models/product_model.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel? product;

  const ProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      resizeToAvoidBottomInset: false,
      appBar: GeneralAppBar(
        screenTitle: product?.productName.titleCase,
        isCenter: false,
        fontSize: 20.sp,
      ),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          spacing: 12.h,
          children: [
            ProductImageDiscount(
              productImage: product?.productImage,
              productDiscount: product?.productDiscount.toInt(),
            ),
            Divider(color: AppColors.welcomeColor.withAlpha(100)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductPrice(
                  productDiscount: product?.productDiscount,
                  productPrice: product?.productPrice,
                ),
                ChangeAmount(),
              ],
            ),
            Divider(color: AppColors.welcomeColor.withAlpha(100)),
            Row(
              spacing: 20.w,
              children: [
                Text(
                  (product?.productStars).toString(),
                  style: AppTextStyles.textFtS20FW500,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      LinearProgressIndicator(
                        color: AppColors.welcomeColor,
                        value: (product?.productStars ?? 0) / 5,
                        minHeight: 30.h,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            AppAssets.filledStar,
                            width: 20.w,
                            colorFilter: ColorFilter.mode(
                              AppColors.splashColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          Text(
                            "${((((product?.productStars) ?? 0) / 5) * 100).toString()}%",
                            style: AppTextStyles.textFtS17FW500.copyWith(
                              color: AppColors.whiteText,
                            ),
                          ),
                          (product?.productStars ?? 0) < 4
                              ? SvgPicture.asset(
                                  AppAssets.outlineStar,
                                  width: 20.w,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.welcomeColor,
                                    BlendMode.srcIn,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ).symmetricPadding(horizontal: 10.w).sized(vertical: 30.h),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              onTap: () {debugPrint("add to cart");},
              decoration: AppBoxDecoration.welcomeButton(
                AppColors.welcomeColor,
              ),
              label: "Add to Cart",
              textColor: AppColors.whiteText,
              icon: SvgPicture.asset(
                AppAssets.shoppingIcon,
                width: 20.w,
                colorFilter: ColorFilter.mode(
                  AppColors.whiteText,
                  BlendMode.srcIn,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            ),
          ],
        ),
      ),
    );
  }
}
