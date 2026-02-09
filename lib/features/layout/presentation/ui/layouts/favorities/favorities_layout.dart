import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/layout/presentation/ui/layouts/favorities/widgets/favorite_Bloc_builder.dart';
import '../../widgets/layout_app_bar.dart';

class FavoritesLayout extends StatelessWidget {
  const FavoritesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LayoutAppBar(screenTitle: "Favorites"),
        ScreenLayout(
          padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
          height: 750.h,
          child: Column(
            children: [
              FavoriteBlocBuilder(),
              SizedBox(height: 60.h,)
            ],
          ).scrolling,
        ),
      ],
    );
  }
}
