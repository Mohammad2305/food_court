import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/features/auth/presentation/ui/pages/set_password/widgets/set_password_fields.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../manager/reset_password/reset_password_cubit.dart';

class SetPasswordForm extends StatelessWidget {
  const SetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> setPasswordKey = GlobalKey();
    return Form(
      key: setPasswordKey,
      child: Column(
        spacing: 8.h,
        children: [
          SetPasswordFields(),
          CustomButton(
            onTap: () {
              if(setPasswordKey.currentState!.validate()){
                context.read<ResetPasswordCubit>().resetPassword(FirebaseAuth.instance.currentUser!);
              }
            },
            decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
            width: 207.w,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            textColor: AppColors.whiteText,
            label: "Create",
          ).centering,
        ],
      ),
    );
  }
}
