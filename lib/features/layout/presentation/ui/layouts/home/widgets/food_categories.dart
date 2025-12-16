import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../data/consts/food_categories.dart';

class FoodCategories extends StatelessWidget {
  const FoodCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categories.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index){
        return Column(
          children: [
            Container(
              decoration: AppBoxDecoration.welcomeButton(AppColors.splashColor),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
              width: 50.w,
              height: 75.h,
              child: SvgPicture.asset(categories[index].icon),
            ),
            Text(categories[index].name, style: AppTextStyles.textFtS12FW500,)
          ],
        );
      },
      separatorBuilder: (context, index)=>SizedBox(width: 16.w,),
    ).sized(vertical: 100.h);
  }
}
