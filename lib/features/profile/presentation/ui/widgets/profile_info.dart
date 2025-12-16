import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: NetworkImage(
            "https://i.pinimg.com/1200x/22/a3/9e/22a39eaccc40ef068c6d060bbc77e8c7.jpg",
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mohammed Nasser",
              style: AppTextStyles.textFtS20FW500.copyWith(
                  color: AppColors.whiteText,
                  fontWeight: FontWeight.w900
              ),
            ),
            Text(
              "Loremipsum@email.com",
              style: AppTextStyles.textFtS15FW500.copyWith(color: AppColors.whiteText),
            ),
          ],
        )
      ],
    ).onlyPadding(bottom: 35.h);
  }
}
