import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/features/profile/data/models/user_model.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ProfileInfo extends StatelessWidget {
  final UserModel? user;
  const ProfileInfo({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: NetworkImage(
            user?.image ?? AppAssets.noImageProfile,
          ) ,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user?.name??"User Name",
              style: AppTextStyles.textFtS20FW500.copyWith(
                  color: AppColors.whiteText,
                  fontWeight: FontWeight.w900
              ),
            ),
            Text(
              user?.email??"UserEmail@gamail.com",
              style: AppTextStyles.textFtS15FW500.copyWith(
                  color: AppColors.whiteText),
            ),
          ],
        )
      ],
    );
  }
}
