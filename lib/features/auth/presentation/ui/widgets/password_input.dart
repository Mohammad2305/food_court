import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';

class PasswordInput extends StatefulWidget {
  final String? inputTitle;
  final TextEditingController inputController;
  final String? Function(String?)? validator;

  const PasswordInput({
    super.key,
    this.inputTitle,
    required this.inputController,
    this.validator,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3.h,
      children: [
        Text(
          widget.inputTitle == null
              ? "Password"
              : "${widget.inputTitle} Password",
          style: AppTextStyles.textFtS17FW500,
        ),
        TextFormField(
          controller: widget.inputController,
          obscureText: isSecure,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.inputTitle == null
                ? "Password"
                : "${widget.inputTitle} Password",
            hintStyle: AppTextStyles.textFtS14FW500,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isSecure = !isSecure;
                });
              },
              child: SvgPicture.asset(
                isSecure ? AppAssets.closeEye : AppAssets.openEye,
              ).onlyPadding(right: 16.w),
            ),
            suffixIconConstraints: BoxConstraints(maxWidth: 32.w),
          ),
        ),
      ],
    );
  }
}
