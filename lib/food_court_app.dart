import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/shared/routing/route_navigator.dart';
import 'package:food_court/cores/shared/themes/app_themes.dart';

class FoodCourtApp extends StatelessWidget {
  const FoodCourtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteNavigator.onGenerateRoute,
          initialRoute: AppRoutes.splashScreen,
          theme: AppThemes.lightTheme,
        );
      },
    );
  }
}