import 'package:flutter/material.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';

class TermsPrivacy extends StatelessWidget {
  const TermsPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: "By continuing, you agree to\n",
            style: AppTextStyles.textFtS12FW300,
          ),
          TextSpan(
            text: "Terms of Use ",
            style: AppTextStyles.textFtS12FW500.copyWith(
              color: AppColors.welcomeColor,
            ),
          ),
          TextSpan(
            text: "and ",
            style: AppTextStyles.textFtS12FW300,
          ),
          TextSpan(
            text: "Privacy Policy.",
            style: AppTextStyles.textFtS12FW500.copyWith(
              color: AppColors.welcomeColor,
            ),
          ),
        ],
      ),
    );
  }
}
