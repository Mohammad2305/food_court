import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';
import 'package:food_court/cores/shared/ui/widgets/general_app_bar.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/orders/presentation/ui/pages/order_review/widgets/review_actions.dart';
import 'package:food_court/features/orders/presentation/ui/pages/order_review/widgets/review_stars.dart';
import '../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../cores/shared/ui/widgets/custom_input.dart';

class OrderReviewScreen extends StatelessWidget {
  const OrderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: GeneralAppBar(screenTitle: "Leave a Review"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          children: [
            Container(
              height: 160.h,
              width: 160.w,
              decoration: AppBoxDecoration.general(AppColors.whiteText, 10.r),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                "https://i.pinimg.com/736x/e2/29/ef/e229efd0283d5f4d8df255d10fc9833f.jpg",
                fit: BoxFit.cover,
              ),
            ).onlyPadding(bottom: 24.h),
            Text(
              "Chicken Burger",
              style: AppTextStyles.textFtS24FW600,
            ).onlyPadding(bottom: 30.h),
            Text(
              "We'd love to know what you think of your dish.",
              style: AppTextStyles.textFtS17FW300,
              textAlign: TextAlign.center,
            ).onlyPadding(bottom: 42.h),
            ReviewStars(onTap: (reviewValue) {},),
            Text(
              "Leave us your comment!",
              style: AppTextStyles.textFtS17FW300,
              textAlign: TextAlign.center,
            ).onlyPadding(bottom: 7.h),
            CustomInput().onlyPadding(bottom: 30.h),
            ReviewActions()
          ],
        ).scrolling,
      ),
    );
  }
}
