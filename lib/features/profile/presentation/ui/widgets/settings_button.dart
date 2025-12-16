import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/features/profile/data/models/profile_detail.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class SettingsButton extends StatelessWidget {
  final ProfileDetailModel profileDetailModel;
  const SettingsButton({super.key, required this.profileDetailModel, });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: profileDetailModel.onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide.none
      ),
      leading: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: AppBoxDecoration.general(AppColors.whiteText, 15.r),
        child: SvgPicture.asset(profileDetailModel.icon, width: 25.w,),
      ),
      title: Text(
        profileDetailModel.title,
        style: AppTextStyles.textFtS15FW500.copyWith(color: AppColors.whiteText),
      ),
    );
  }
}
