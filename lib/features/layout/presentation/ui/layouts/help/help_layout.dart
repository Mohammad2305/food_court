import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../cores/shared/ui/widgets/screen_layout.dart';
import '../../widgets/layout_app_bar.dart';

class HelpLayout extends StatelessWidget {
  const HelpLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LayoutAppBar(screenTitle: "Help"),
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
