import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/features/account/presentation/ui/widgets/choosing_image.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ProfileImage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String? image;

  const ProfileImage({super.key, required this.scaffoldKey, this.image});

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
            image ?? AppAssets.noImageProfile,
            fit: BoxFit.cover,
          ),
        ),
        InkWell(
          onTap: () {
            scaffoldKey.currentState?.showBottomSheet((context) {
              return ChoosingImage();
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
    );
  }
}
