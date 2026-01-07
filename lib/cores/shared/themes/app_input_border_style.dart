import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBorderStyles {
  static InputBorder border = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(13.r),
  );

  static InputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(13.r),
  );

  static InputBorder enabledBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(13.r),
  );

  static InputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 0.0),
    borderRadius: BorderRadius.circular(13.r),
  );

  static InputBorder disabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 0),
    borderRadius: BorderRadius.circular(13.r),
  );
}
