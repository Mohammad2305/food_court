import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_button.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/cores/utils/functions/image_choose.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../../profile/data/models/user_model.dart';

class ProfileImage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final UserModel? user;

  const ProfileImage({super.key, required this.scaffoldKey, this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(1.w, 1.h),
      children: [
        Container(
          width: 130.w,
          height: 130.h,
          decoration: AppBoxDecoration.welcomeButton(AppColors.whiteText),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            user?.image ?? AppAssets.noImageProfile,
            fit: BoxFit.cover,
          ),
        ),
        InkWell(
          onTap: () {
            scaffoldKey.currentState?.showBottomSheet((context) {
              return Container(
                decoration: AppBoxDecoration.welcomeButton(
                  AppColors.splashColor.withAlpha(200),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.h,
                  children: [
                    CustomButton(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      onTap: () {
                        LocalMedia.chooseGalleryImage();
                        Navigator.pop(context);
                      },
                      decoration: AppBoxDecoration.welcomeButton(
                        AppColors.welcomeColor,
                      ),
                      label: "Choose From Gallery",
                      textColor: AppColors.whiteText,
                    ),
                    CustomButton(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      onTap: () {
                        LocalMedia.chooseCameraImage();
                        Navigator.pop(context);
                      },
                      decoration: AppBoxDecoration.welcomeButton(
                        AppColors.welcomeColor,
                      ),
                      label: "Choose From Camera",
                      textColor: AppColors.whiteText,
                    ),
                  ],
                ),
              );
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            decoration: AppBoxDecoration.general(AppColors.welcomeColor, 10.r),
            clipBehavior: Clip.hardEdge,
            child: SvgPicture.asset(
              AppAssets.camera,
              width: 20.w,
              colorFilter: ColorFilter.mode(
                AppColors.whiteText,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    ).onlyPadding(bottom: 35.h);
  }
}
