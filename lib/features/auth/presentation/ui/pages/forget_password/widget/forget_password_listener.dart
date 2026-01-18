import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_court/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:food_court/features/auth/presentation/ui/pages/forget_password/widget/forget_password_form.dart';
import '../../../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';

class ForgetPasswordListener extends StatelessWidget {
  const ForgetPasswordListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: AppColors.welcomeColor,
              ),
            ),
          );
        }
        else if (state is ForgetPasswordSuccessful) {
          Navigator.pop(context); // close loading
          Navigator.pushNamed(context, AppRoutes.setPasswordScreen,);
        }
        else if (state is ForgetPasswordError) {
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
      child: ForgetPasswordForm(),
    );
  }
}
