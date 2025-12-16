import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String screenTitle;

  const AuthAppBar({super.key, required this.screenTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: AppColors.welcomeColor,
        size: 30.sp,
      ),
      title: Text(
        screenTitle,
        textAlign: TextAlign.center,
        style: AppTextStyles.textFtS28FW700.copyWith(
          color: AppColors.whiteText,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.keyboard_arrow_left),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56.h);
}
