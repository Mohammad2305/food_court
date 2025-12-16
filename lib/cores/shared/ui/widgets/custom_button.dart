import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../themes/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final BoxDecoration decoration;
  final Widget? icon;
  final String label;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? textColor;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.decoration,
    this.icon,
    required this.label,
    this.width,
    this.margin,
    this.textColor,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: padding,
        margin: margin,
        decoration: decoration,
        child: Row(
          spacing: 5.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? SizedBox.shrink(),
            Text(
              label,
              style: textStyle?.copyWith(color: textColor) ?? AppTextStyles.textFtS17FW500.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
