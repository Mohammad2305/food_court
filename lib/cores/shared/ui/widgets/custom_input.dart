import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';

class CustomInput extends StatelessWidget {
  final String? inputTitle;
  const CustomInput({super.key, this.inputTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3.h,
      children: [
        Text(
          inputTitle??"",
          style: inputTitle==null ? AppTextStyles.zero : AppTextStyles.textFtS17FW500,
        ),
        TextFormField(),
      ],
    );
  }
}
