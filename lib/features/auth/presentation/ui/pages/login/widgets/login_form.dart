import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:food_court/features/auth/presentation/ui/pages/login/widgets/login_fields.dart';
import '../../../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginKey = GlobalKey();
    return Form(
      key: loginKey,
      child: Column(
        spacing: 8.h,
        children: [
          const LoginFields(),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.forgetPassword);
            },
            child: Text(
              "forget password",
              style: AppTextStyles.textFtS14FW500.copyWith(
                color: AppColors.welcomeColor,
              ),
            ),
          ).rightAligning,
          CustomButton(
            onTap: () {
              if (loginKey.currentState!.validate()) {
                context.read<LoginCubit>().signInEmailAndPassword(
                  password: context.read<LoginCubit>().password.text,
                  email: context.read<LoginCubit>().email.text,
                );
              }
            },
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            width: 207.w,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            textColor: AppColors.whiteText,
            label: "Log In",
          ).centering,
        ],
      ),
    );
  }
}
