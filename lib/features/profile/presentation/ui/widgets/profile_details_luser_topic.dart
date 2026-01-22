import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_court/features/profile/presentation/manager/profile_data_cubit.dart';
import 'package:food_court/features/profile/presentation/ui/widgets/user_topic_profile.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../data/models/profile_detail.dart';
import 'settings_button.dart';

class ProfileDetailsUserTopic extends StatelessWidget {
  const ProfileDetailsUserTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProfileDataCubit, ProfileDataState>(
          builder: (context, state) {
            if (state is ProfileDataLoading) {
              return Skeletonizer(
                effect: PulseEffect(
                    from: AppColors.splashColor,
                    to: AppColors.splashColor.withAlpha(100)
                ),
                child: UserTopicProfile(),
              );
            }
            if (state is ProfileDataError) {
              return Text(state.message, style: const TextStyle(color: Colors.red));
            }
            if (state is ProfileDataSuccessful) {
              final user = state.user;
              return UserTopicProfile(user: user);
            }
            return const SizedBox();
          },
        ),
        SettingsButton(
          profileDetailModel: ProfileDetailModel(
            icon: AppAssets.contactIcon,
            title: 'Contact Us',
            onTap: () {
              debugPrint("go to contacts");
            },
          ),
        ),
        SettingsButton(
          profileDetailModel: ProfileDetailModel(
            icon: AppAssets.helpIcon,
            title: 'Help & FAQs',
            onTap: () {
              debugPrint("go to help");
            },
          ),
        ),
        SettingsButton(
          profileDetailModel: ProfileDetailModel(
            icon: AppAssets.settingIcon,
            title: 'Settings',
            onTap: () {
              debugPrint("go to settings");
            },
          ),
        ),
        SettingsButton(
          profileDetailModel: ProfileDetailModel(
            icon: AppAssets.logoutIcon,
            title: 'Log Out',
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.loginScreen,
                    (_) => false,
              );
            },
          ),
        ),
      ],
    );
  }
}
