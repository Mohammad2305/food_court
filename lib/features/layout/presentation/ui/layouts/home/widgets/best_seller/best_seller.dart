import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../../cores/utils/constants/app_colors.dart';
import 'best_seller_bloc_builder.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Best Seller", style: AppTextStyles.textFtS20FW500),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "View All",
                    style: AppTextStyles.textFtS12FW500.copyWith(
                      color: AppColors.welcomeColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.welcomeColor,
                    size: 15.r,
                  ),
                ],
              ),
            ),
          ],
        ),
        BestSellerBlocBuilder(),
      ],
    );
  }
}
