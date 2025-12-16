import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';

class WelcomeDescription extends StatelessWidget {
  const WelcomeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 295.w,
      child: Text(
        "Delicious meals are just a tap away. Let’s find something tasty for you today!",
        style: AppTextStyles.textFtS14FW500.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
