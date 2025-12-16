import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/shared/themes/app_boxes_decoration.dart';
import 'package:food_court/cores/shared/themes/app_text_styles.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_button.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/orders/presentation/manager/orders_cubit.dart';
import 'package:food_court/features/orders/presentation/ui/pages/cancel-order/widgets/cancel_reason.dart';
import '../../../../../../cores/shared/ui/widgets/general_app_bar.dart';

class CancelOrderScreen extends StatelessWidget {
  const CancelOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: GeneralAppBar(screenTitle: "Cancel Order"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Changed your mind? Cancel your order easily before preparation "
                  "starts and get a quick refund if applicable.",
              style: AppTextStyles.textFtS14FW300,
            ).onlyPadding(bottom: 14.h),
            BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                return CancelReasons(selected: context.read<OrdersCubit>().value,);
              },
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.successCancelScreen);
              },
              decoration: AppBoxDecoration.welcomeButton(
                AppColors.welcomeColor,
              ),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 45.w),
              width: 207.w,
              textColor: AppColors.whiteText,
              label: "submit".firstCharacterUpper,
            ).centering,
          ],
        ),
      ),
    );
  }
}