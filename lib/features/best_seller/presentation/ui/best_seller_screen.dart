import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';
import 'package:food_court/cores/shared/ui/widgets/general_app_bar.dart';
import 'package:food_court/features/best_seller/presentation/ui/widgets/best_seller_bloc_builder.dart';
import '../../../../cores/shared/ui/widgets/screen_layout.dart';
import '../../../../cores/utils/constants/app_colors.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      resizeToAvoidBottomInset: false,
      appBar: GeneralAppBar(screenTitle: "Best Seller"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          spacing: 25.h,
          children: [
            Text(
              "Discover our most popular dishes!",
              style: AppTextStyles.textFtS20FW500.copyWith(
                color: AppColors.welcomeColor,
              ),
            ),
            Expanded(child: BestSellerBlocBuilder()),
          ],
        ),
      ),
    );
  }
}
