import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import '../../../../cores/utils/constants/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      _navigate();
    });
    super.initState();
  }

  void _navigate() {
    final route = FirebaseAuth.instance.currentUser != null
        ? AppRoutes.layoutScreen
        : AppRoutes.onboardingScreen;

    Navigator.pushNamedAndRemoveUntil(context, route, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(AppAssets.splash)),
      backgroundColor: AppColors.splashColor,
    );
  }
}
