import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/delivery_address/presentation/ui/pages/new_address/widgets/new_address_form.dart';
import '../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../cores/shared/ui/widgets/general_app_bar.dart';
import '../../../../../../cores/shared/ui/widgets/screen_layout.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';

class NewAddressScreen extends StatelessWidget {
  const NewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: GeneralAppBar(screenTitle: "Add New Address",),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          children: [
            SvgPicture.asset(
              AppAssets.address,
              colorFilter: ColorFilter.mode(AppColors.welcomeColor, BlendMode.srcIn),
              width: 80.w,
            ).onlyPadding(bottom: 50.h),
            NewAddressForm(),
            CustomButton(
              onTap: () {debugPrint("add new address");},
              decoration: AppBoxDecoration.welcomeButton(
                AppColors.welcomeColor,
              ),
              width: 150.w,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              textColor: AppColors.whiteText,
              label: "Apply",
            ),
          ],
        ),
      ),
    );
  }
}
