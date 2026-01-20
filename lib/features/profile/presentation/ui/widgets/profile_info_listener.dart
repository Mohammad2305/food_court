import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/profile/presentation/manager/profile_data_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'profile_info.dart';

class ProfileInfoListener extends StatefulWidget {
  const ProfileInfoListener({super.key});

  @override
  State<ProfileInfoListener> createState() => _ProfileInfoListenerState();
}

class _ProfileInfoListenerState extends State<ProfileInfoListener> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        if (state is ProfileDataLoading) {
          return Skeletonizer(
            effect: PulseEffect(
              from: AppColors.splashColor,
              to: AppColors.splashColor.withAlpha(100)
            ),
            child: ProfileInfo(),
          );
        }
        if (state is ProfileDataError) {
          return Text(state.message, style: const TextStyle(color: Colors.red));
        }
        if (state is ProfileDataSuccessful) {
          final user = state.user;
          return ProfileInfo(user: user);
        }
        return const SizedBox();
      },
    ).onlyPadding(bottom: 35.h);
  }
}
