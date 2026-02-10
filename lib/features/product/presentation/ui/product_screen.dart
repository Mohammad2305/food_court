import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_court/cores/shared/themes/app_boxes_decoration.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_button.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/product/presentation/ui/widgets/adds_bloc_builder.dart';
import 'package:food_court/features/product/presentation/ui/widgets/change_amount.dart';
import 'package:food_court/features/product/presentation/ui/widgets/product_image_discount.dart';
import 'package:food_court/features/product/presentation/ui/widgets/product_price.dart';
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
              product: product,
            ),
            Text(
              product?.productDescription == ""
                  ? "Product Description"
                  : product?.productDescription ?? "Product Description",
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
            Expanded(child: AddsBlocBuilder(addChooses: product?.chooses, addPrice: 1,)),
            CustomButton(
              onTap: () {
                debugPrint("add to cart");
              },
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
