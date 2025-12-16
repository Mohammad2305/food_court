import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(AppAssets.splash),
    );
  }
}
