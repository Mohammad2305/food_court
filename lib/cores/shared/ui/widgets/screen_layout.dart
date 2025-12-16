import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../themes/app_boxes_decoration.dart';

class ScreenLayout extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double height;
  const ScreenLayout({super.key, required this.child, this.padding, required this.height});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Container(
        padding: padding,
        height: height,
        decoration: AppBoxDecoration.welcomeButton(Colors.white),
        width: double.infinity,
        child: child,
      ),
    );
  }
}
