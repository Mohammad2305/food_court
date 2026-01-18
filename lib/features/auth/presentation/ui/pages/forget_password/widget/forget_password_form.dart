import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:food_court/features/auth/presentation/ui/pages/forget_password/widget/forget_password_fields.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> forgetPassword = GlobalKey();
    return Form(
      key: forgetPassword,
      child: Column(
        spacing: 20.h,
        children: [
          ForgetPasswordFields(),
          CustomButton(
            onTap: () async {
              if (forgetPassword.currentState!.validate()) {
                await context.read<ResetPasswordCubit>().forgetPassword(
                  email: context.read<ResetPasswordCubit>().email.text.trim(),
                );
              }
            },
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            width: 207.w,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            textColor: AppColors.whiteText,
            label: "Send",
          ).centering,
        ],
      ),
    );
  }
}
