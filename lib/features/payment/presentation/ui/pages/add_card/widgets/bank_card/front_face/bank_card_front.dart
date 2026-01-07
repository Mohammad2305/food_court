import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/features/payment/presentation/ui/pages/add_card/widgets/bank_card/front_face/widgets/bank_card_front_info.dart';
import 'package:food_court/features/payment/presentation/ui/pages/add_card/widgets/bank_card/front_face/widgets/head_bank_card_front.dart';
import '../../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../../cores/utils/constants/app_colors.dart';

class BankCardFront extends StatelessWidget {
  const BankCardFront({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      decoration: AppBoxDecoration.card(background: AppColors.splashColor),
      height: 195.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadBankCardFront(),
          Spacer(),
          BankCardFrontInfo()
        ],
      ),
    );
  }
}
