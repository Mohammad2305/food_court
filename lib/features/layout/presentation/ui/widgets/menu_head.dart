import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/utils/constants/app_constants.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import 'action_item.dart';

class MenuHead extends StatelessWidget {
  const MenuHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          children: [
            SizedBox(
              width: 200.w,
              height: 30.h,
              child: SearchBar(
                trailing: {
                  CircleAvatar(
                    radius: 10.r,
                    backgroundColor: AppColors.welcomeColor,
                    child: SvgPicture.asset(AppAssets.searchIcon),
                  ),
                },
              ),
            ),
            Spacer(),
            ActionItem(
              iconPath: AppAssets.cartIcon,
              onTap: () {
                // context.read<HomeCubit>().getBestSellerProducts();
                FirebaseFirestore.instance.collection("foods").add({
                  "product_name": "Chicken Biryani",
                  "product_image": "https://i.pinimg.com/736x/0b/dc/28/0bdc281c243a6179adb33b954540fb96.jpg",
                  "product_price": 48.00,
                  "product_category": AppConstants.meals,
                  "product_stars": 4.8,
                  "product_orders_numbers": 480,
                  "product_discount": 0.0,
                });
              },
            ),
            ActionItem(iconPath: AppAssets.notificationIcon, onTap: () {}),
            ActionItem(
              iconPath: AppAssets.profileIcon,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.profileScreen);
              },
            ),
          ],
        ).onlyPadding(bottom: 16.h),
      ],
    ).symmetricPadding(horizontal: 36.w);
  }
}
