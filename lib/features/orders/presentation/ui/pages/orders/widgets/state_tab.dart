import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../data/consts/order_states.dart';

class StateTab extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;

  const StateTab({super.key, required this.currentIndex, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            onTap(index);
          },
          child: Container(
            width: 105.w,
            alignment: Alignment.center,
            decoration: AppBoxDecoration.welcomeButton(
              index == currentIndex
                  ? AppColors.welcomeColor
                  : AppColors.welcomeColor.withAlpha(100),
            ),
            child: Text(
              orderStates()[index].state,
              style: AppTextStyles.textFtS17FW500.copyWith(
                color: index == currentIndex
                    ? AppColors.whiteText
                    : AppColors.welcomeColor,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 3.w),
      itemCount: orderStates().length,
    ).sized(vertical: 30.h);
  }
}
