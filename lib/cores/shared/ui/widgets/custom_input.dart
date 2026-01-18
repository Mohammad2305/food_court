import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';

class CustomInput extends StatelessWidget {
  final String? inputTitle;
  final TextEditingController inputController;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final String? Function(String?)? validator;

  const CustomInput({
    super.key,
    this.inputTitle,
    required this.inputController,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.readOnly,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3.h,
      children: [
        Text(
          inputTitle ?? "",
          style: inputTitle == null
              ? AppTextStyles.zero
              : AppTextStyles.textFtS17FW500,
        ),
        TextFormField(
          controller: inputController,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.textFtS14FW500,
            suffixIcon: suffixIcon,
          ),
          keyboardType: keyboardType,
          readOnly: readOnly ?? false,
        ),
      ],
    );
  }
}
