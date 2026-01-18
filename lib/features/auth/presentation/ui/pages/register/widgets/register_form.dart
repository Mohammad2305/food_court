import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:food_court/features/auth/presentation/ui/pages/register/widgets/register_fields.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import 'terms_privacy.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> registerKey = GlobalKey();
    return Form(
      key: registerKey,
      child: Column(
        spacing: 8.h,
        children: [
          const RegisterFields(),
          const TermsPrivacy(),
          CustomButton(
            onTap: () {
              if (registerKey.currentState!.validate()) {
                context.read<RegisterCubit>().createAccountWithEmailAndPassword(
                  fullName: context.read<RegisterCubit>().name.text,
                  password: context.read<RegisterCubit>().password.text,
                  email: context.read<RegisterCubit>().email.text,
                  mobileNumber: context.read<RegisterCubit>().mobile.text,
                  birthDate: context.read<RegisterCubit>().date.text,
                );
              }
            },
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            width: 207.w,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            textColor: AppColors.whiteText,
            label: "Sign Up",
          ).centering,
        ],
      ),
    );
  }
}
