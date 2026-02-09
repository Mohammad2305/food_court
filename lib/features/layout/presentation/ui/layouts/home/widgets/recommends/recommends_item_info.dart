import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../../../../cores/utils/extensions/aligns.dart';
import '../../../../../../../../cores/utils/extensions/paddings.dart';
import '../../../../../../data/models/product_model.dart';

class RecommendsItemInfo extends StatelessWidget {
  final ProductModel? productModel;

  const RecommendsItemInfo({super.key, this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: AppBoxDecoration.welcomeButton(AppColors.whiteText),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Row(
            spacing: 1.w,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${productModel?.productStars ?? "5.0"}",
                style: AppTextStyles.textFtS12FW500,
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
        ).leftAligning,
        Container(
          decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Text(
            "\$${productModel?.productPrice.toStringAsFixed(2) ?? 0.0}",
            style: AppTextStyles.textFtS12FW500.copyWith(
              color: AppColors.whiteText,
            ),
          ),
        ).rightAligning,
      ],
    ).symmetricPadding(vertical: 10.h, horizontal: 10.w);
  }
}
