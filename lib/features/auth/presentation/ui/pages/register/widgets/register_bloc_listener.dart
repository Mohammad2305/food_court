import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/themes/app_boxes_decoration.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_button.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/auth/data/repo/auth_repo_impl.dart';
import 'package:food_court/features/auth/presentation/ui/pages/register/widgets/register_form.dart';
import '../../../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../manager/register/register_cubit.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: AppColors.welcomeColor),
            ),
          );
        }
        else if (state is RegisterSuccessful) {
          Navigator.pop(context); // close loading
          Navigator.pushNamed(context, AppRoutes.loginScreen);
        }
        else if (state is RegisterError) {
          Navigator.pop(context); // close loading
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(
                  Icons.error_outline_outlined,
                  color: AppColors.welcomeColor,
                ),
                title: Text("Error", style: AppTextStyles.textFtS20FW500),
                content: Text(
                  state.error,
                  style: AppTextStyles.textFtS14FW300,
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        }
        else if (state is EmailNotVerified) {
          Navigator.pop(context); // close loading
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(Icons.warning, color: AppColors.welcomeColor),
                title: Text("Warning", style: AppTextStyles.textFtS20FW500),
                content: Text(
                  "email not verified",
                  style: AppTextStyles.textFtS14FW300,
                  textAlign: TextAlign.center,
                ),
                actions: [
                  CustomButton(
                    onTap: () {
                      AuthRepoImpl().emailVerify(
                        user: FirebaseAuth.instance.currentUser,
                      );
                      Navigator.pushNamed(context, AppRoutes.loginScreen);
                    },
                    decoration: AppBoxDecoration.welcomeButton(
                      AppColors.welcomeColor,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    textColor: AppColors.whiteText,
                    label: "Send",
                  ),
                ],
              );
            },
          );
        }
      },
      child: const RegisterForm(),
    ).onlyPadding(bottom: 9.h);
  }
}
