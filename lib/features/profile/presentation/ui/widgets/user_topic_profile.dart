import 'package:flutter/material.dart';
import 'package:food_court/cores/utils/constants/app_constants.dart';
import 'package:food_court/features/profile/presentation/ui/widgets/settings_button.dart';
import '../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../data/models/profile_detail.dart';
import '../../../data/models/user_model.dart';

class UserTopicProfile extends StatelessWidget {
  final UserModel? user;
  const UserTopicProfile({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsButton(
          profileDetailModel: ProfileDetailModel(
            icon: AppAssets.shoppingIcon,
            title: 'My Orders',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.ordersScreen, arguments: user);
            },
          ),
        ),
        SettingsButton(
          profileDetailModel: ProfileDetailModel(
            icon: AppAssets.profileIcon,
            title: 'My Profile',
            onTap: () async{
              await Navigator.pushNamed(context, AppRoutes.accountScreen);
            },
          ),
        ),
        SettingsButton(
          profileDetailModel: ProfileDetailModel(
            icon: AppAssets.locationIcon,
            title: 'Delivery Address',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.addressListScreen);
            },
          ),
        ),
      ],
    );
  }
}
