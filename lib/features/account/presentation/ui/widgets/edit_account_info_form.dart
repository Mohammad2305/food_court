import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/cores/utils/functions/dates.dart';
import 'package:food_court/features/profile/data/models/user_model.dart';
import 'package:food_court/features/profile/presentation/manager/profile_data_cubit.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../cores/shared/ui/widgets/custom_input.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import 'profile_image.dart';

class EditAccountInfoForm extends StatelessWidget {
  final UserModel? user;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const EditAccountInfoForm({super.key, this.user, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            spacing: 30.h,
            children: [
              ProfileImage(scaffoldKey: scaffoldKey, user: user,),
              CustomInput(
                inputTitle: "Full Name",
                hintText: user?.name ?? "No Name",
                inputController: context.read<ProfileDataCubit>().name,
              ),
              CustomInput(
                inputTitle: "Date of Birth",
                hintText: user?.birthDay ?? AppDates.customDateForm(DateTime.now()),
                inputController: context.read<ProfileDataCubit>().date,
              ),
              CustomInput(
                inputTitle: "Email",
                hintText: user?.email ?? "example@example.com",
                inputController: context.read<ProfileDataCubit>().email,
              ),
              CustomInput(
                inputTitle: "Phone Number",
                hintText: user?.phoneNumber ?? "+000 000 0000",
                inputController: context.read<ProfileDataCubit>().mobile,
              ),
            ],
          ),
        ),
        CustomButton(
          onTap: () {
            context.read<ProfileDataCubit>().updateUserDate();
            Navigator.pushNamed(context, AppRoutes.layoutScreen);
          },
          decoration: AppBoxDecoration.welcomeButton(AppColors.welcomeColor),
          label: "Update Profile",
          width: 145.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          textColor: AppColors.whiteText,
        ).onlyPadding(top: 35.h),
      ],
    );
  }
}
