import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_button.dart';
import 'package:food_court/cores/utils/functions/image_choose.dart';
import 'package:food_court/features/profile/presentation/manager/profile_data_cubit.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class ChoosingImage extends StatelessWidget {
  const ChoosingImage({super.key});

  @override
  Widget build(BuildContext context) {
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
            onTap: () async {
              final imagePath = await LocalMedia.chooseGalleryImage();
              if (imagePath == null) return;
              if (context.mounted) {
                context.read<ProfileDataCubit>().uploadToCloudinary(
                  imageFile: imagePath,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.layoutScreen,
                      (_) => false,
                ); //
              }
            },
            decoration: AppBoxDecoration.welcomeButton(
              AppColors.welcomeColor,
            ),
            label: "Choose From Gallery",
            textColor: AppColors.whiteText,
          ),
          CustomButton(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            onTap: () async {
              final imagePath = await LocalMedia.chooseCameraImage();
              if (imagePath == null) return;
              if (context.mounted) {
                context.read<ProfileDataCubit>().uploadToCloudinary(
                  imageFile: imagePath,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.layoutScreen,
                      (_) => false,
                ); //
              }
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
  }
}
