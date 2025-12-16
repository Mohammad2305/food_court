import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../cores/utils/constants/app_colors.dart';

class AuthBottom extends StatelessWidget {
  final String question;
  final String answer;
  final String screenName;

  const AuthBottom({super.key, required this.question, required this.answer, required this.screenName});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question, style: AppTextStyles.textFtS14FW300),
        TextButton(
          onPressed: (){
            Navigator.pushNamed(context, screenName);
          },
          child: Text(
            answer,
            style: AppTextStyles.textFtS14FW300.copyWith(
              color: AppColors.welcomeColor,
            ),
          ),
        ),
      ],
    );
  }
}
