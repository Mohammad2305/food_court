import 'package:flutter/material.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'widgets/splash_content.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.onboardingScreen, (_)=>false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashContent(), backgroundColor: AppColors.splashColor,);
  }
}
