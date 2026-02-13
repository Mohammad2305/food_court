import 'package:flutter/material.dart';
import '../../themes/app_boxes_decoration.dart';

class ScreenLayout extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double height;
  final Color? screenLayoutColor;
  const ScreenLayout({super.key, required this.child, this.padding, required this.height, this.screenLayoutColor});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Container(
        padding: padding,
        height: height,
        margin: EdgeInsets.zero,
        decoration: AppBoxDecoration.welcomeButton(screenLayoutColor??Colors.white),
        width: double.infinity,
        child: child,
      ),
    );
  }
}
