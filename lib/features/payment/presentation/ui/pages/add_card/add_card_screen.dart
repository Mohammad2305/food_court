import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/payment/presentation/ui/pages/add_card/widgets/add_card_form.dart';
import 'package:food_court/features/payment/presentation/ui/pages/add_card/widgets/bank_card/bank_card.dart';
import '../../../../../../cores/shared/ui/widgets/general_app_bar.dart';
import '../../../../../../cores/shared/ui/widgets/screen_layout.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: GeneralAppBar(screenTitle: "Add Card"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          children: [
            BankCard(),
            AddCardForm(),
          ],
        ).scrolling,
      ),
    );
  }
}
