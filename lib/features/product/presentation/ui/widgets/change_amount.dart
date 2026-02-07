import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ChangeAmount extends StatefulWidget {
  const ChangeAmount({super.key});

  @override
  State<ChangeAmount> createState() => _ChangeAmountState();
}

class _ChangeAmountState extends State<ChangeAmount> {
  int count = 0 ;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: [
        InkWell(
          onTap: () {
            if(count>0){
              setState(() {
                count--;
              });
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            child: Icon(Icons.remove, color: AppColors.whiteText),
          ),
        ),
        Text(count.toString(), style: AppTextStyles.textFtS24FW500),
        InkWell(
          onTap: () {
            setState(() {
              count++;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            child: Icon(Icons.add, color: AppColors.whiteText),
          ),
        ),
      ],
    );
  }
}
