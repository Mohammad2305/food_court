import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ProductImage extends StatelessWidget {
  final String? image;
  const ProductImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.welcomeButton(
        AppColors.welcomeColor,
      ),
      width: double.infinity,
      height: 150.h,
      clipBehavior: Clip.hardEdge,
      child: Image.network(
         image ?? AppAssets.imageSample,
        fit: BoxFit.cover,
      ),
    );
  }
}
