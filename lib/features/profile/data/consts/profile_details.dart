import 'package:flutter/cupertino.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/features/profile/data/models/profile_detail.dart';
import '../../../../cores/utils/constants/app_assets.dart';

List<ProfileDetailModel> profileDetails(BuildContext context) => [
  ProfileDetailModel(
    icon: AppAssets.shoppingIcon,
    title: 'My Orders',
    onTap: () {
      Navigator.pushNamed(context, AppRoutes.ordersScreen);
    },
  ),
  ProfileDetailModel(
    icon: AppAssets.profileIcon,
    title: 'My Profile',
    onTap: () {
      Navigator.pushNamed(context, AppRoutes.accountScreen);
    },
  ),
  ProfileDetailModel(
    icon: AppAssets.locationIcon,
    title: 'Delivery Address',
    onTap: () {
      Navigator.pushNamed(context, AppRoutes.addressListScreen);
    },
  ),
  ProfileDetailModel(
    icon: AppAssets.paymentIcon,
    title: 'Payment Methods',
    onTap: () {
      Navigator.pushNamed(context, AppRoutes.methodsScreen);
    },
  ),
  ProfileDetailModel(
    icon: AppAssets.contactIcon,
    title: 'Contact Us',
    onTap: () {debugPrint("go to contacts");},
  ),
  ProfileDetailModel(
    icon: AppAssets.helpIcon,
    title: 'Help & FAQs',
    onTap: () {debugPrint("go to help");},
  ),
  ProfileDetailModel(
    icon: AppAssets.settingIcon,
    title: 'Settings',
    onTap: () {debugPrint("go to settings");},
  ),
  ProfileDetailModel(
    icon: AppAssets.logoutIcon,
    title: 'Log Out',
    onTap: () {debugPrint("Log Out");},
  ),
];
