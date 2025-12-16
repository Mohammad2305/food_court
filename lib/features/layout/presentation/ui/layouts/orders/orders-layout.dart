import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import '../../widgets/layout_app_bar.dart';

class OrdersLayout extends StatelessWidget {
  const OrdersLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LayoutAppBar(screenTitle: "Orders"),
        ScreenLayout(
          padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
          height: 750.h,
          child: SingleChildScrollView(
            child: Column(
              spacing: 30.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
