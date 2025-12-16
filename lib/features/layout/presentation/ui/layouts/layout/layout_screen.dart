import 'package:flutter/material.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../data/consts/layouts.dart';
import '../../widgets/bottom_navigation_custom_build.dart';
int currentIndex = 0;

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            layouts[currentIndex],
            BottomNavigationCustomBuild(
              currentIndex: currentIndex,
              onTap: (index){
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
