import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../cores/shared/ui/widgets/custom_button.dart';
import '../../../../../../cores/shared/ui/widgets/general_app_bar.dart';
import '../../../../../../cores/shared/ui/widgets/screen_layout.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';
import '../../../manager/payment_cubit.dart';
import 'widgets/payment_methods.dart';

class MethodsScreen extends StatelessWidget {
  const MethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: GeneralAppBar(screenTitle: "Payment Methods"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          children: [
            BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                return PaymentMethods(
                  selected: context.read<PaymentCubit>().value,
                );
              },
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.addCardScreen);
              },
              decoration: AppBoxDecoration.welcomeButton(
                AppColors.welcomeColor.withAlpha(100),
              ),
              width: 150.w,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              textColor: AppColors.welcomeColor,
              label: "Add Card",
            ).onlyPadding(top: 10.h),
          ],
        ),
      ),
    );
  }
}
