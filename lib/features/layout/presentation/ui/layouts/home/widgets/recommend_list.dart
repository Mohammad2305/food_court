import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';

import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';

class RecommendList extends StatelessWidget {
  const RecommendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "recommend".firstCharacterUpper,
          style: AppTextStyles.textFtS20FW500,
        ),
        GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 140.h,
            crossAxisSpacing: 9.w,
            mainAxisSpacing: 9.h,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: AppBoxDecoration.welcomeButton(
                AppColors.splashColor,
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                AppAssets.imageSample,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ],
    );
  }
}
