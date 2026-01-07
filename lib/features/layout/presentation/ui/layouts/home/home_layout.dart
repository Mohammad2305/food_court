import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../cores/shared/ui/widgets/screen_layout.dart';
import 'widgets/ads_center.dart';
import 'widgets/best_seller.dart';
import 'widgets/food_categories.dart';
import 'widgets/home_head.dart';
import 'widgets/recommend_list.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeHead(),
        ScreenLayout(
          height: 700.h,
          child:
              Column(
                    spacing: 14.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FoodCategories(),
                      Divider(),
                      BestSeller(),
                      AdsCenter(),
                      RecommendList()
                    ],
                  )
                  .onlyPadding(left: 36.w, right: 36.w, top: 34.h, bottom: 100.h)
                  .scrolling,
        ),
      ],
    );
  }
}
