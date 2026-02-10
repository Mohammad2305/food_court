import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/shared/themes/app_boxes_decoration.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_button.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/auth/presentation/manager/platform_auth/platform_auth_cubit.dart';

class PlatformsSigns extends StatelessWidget {
  const PlatformsSigns({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 9.19.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<PlatformAuthCubit, PlatformAuthState>(
              listener: (context, state) {
                if (state is GoogleAuthLoading) {
                  showDialog(
                    context: context,
                    builder: (context) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.welcomeColor,
                      ),
                    ),
                  );
                } else if (state is GoogleAuthSuccessful) {
                  Navigator.pop(context); // close loading
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.layoutScreen,
                    (_) => false,
                  );
                } else if (state is GoogleAuthError) {
                  Navigator.pop(context); // close loading
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        icon: Icon(
                          Icons.error_outline_outlined,
                          color: AppColors.welcomeColor,
                        ),
                        title: Text(
                          "Error",
                          style: AppTextStyles.textFtS20FW500,
                        ),
                        content: Text(
                          state.error,
                          style: AppTextStyles.textFtS14FW300,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  );
                }
              },
              child: CustomButton(
                onTap: () async {
                  await context.read<PlatformAuthCubit>().googleAuth();
                },
                decoration: AppBoxDecoration.welcomeButton(
                  AppColors.iconCircle,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                icon: SvgPicture.asset(AppAssets.gmailIcon),
                label: "sign in with google".titleCase,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
