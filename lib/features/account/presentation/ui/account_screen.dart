import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/ui/widgets/general_app_bar.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/account/presentation/ui/widgets/edit_account_info_form.dart';
import 'package:food_court/features/account/presentation/ui/widgets/profile_image.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      resizeToAvoidBottomInset: false,
      appBar: GeneralAppBar(screenTitle: "My profile"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          children: [
            ProfileImage(),
            EditAccountInfoForm()
          ],
        ).scrolling,
      ),
    );
  }
}
