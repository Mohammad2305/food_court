import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/shared/routing/app_routes.dart';
import 'package:food_court/cores/shared/themes/app_boxes_decoration.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_button.dart';
import 'package:food_court/cores/shared/ui/widgets/general_app_bar.dart';
import 'package:food_court/cores/shared/ui/widgets/screen_layout.dart';
import 'package:food_court/cores/utils/constants/app_colors.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/features/delivery_address/presentation/manager/delivery_address_cubit.dart';
import 'package:food_court/features/delivery_address/presentation/ui/pages/addresses_list/widgets/your_addresses.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: GeneralAppBar(screenTitle: "Delivery Address"),
      body: ScreenLayout(
        height: 750.h,
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        child: Column(
          children: [
            BlocBuilder<DeliveryAddressCubit, DeliveryAddressState>(
              builder: (context, state) {
                return YourAddresses(
                  selected: context.read<DeliveryAddressCubit>().value,
                );
              },
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.newAddressScreen);
              },
              decoration: AppBoxDecoration.welcomeButton(
                AppColors.welcomeColor.withAlpha(100),
              ),
              width: 150.w,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              textColor: AppColors.welcomeColor,
              label: "Create Address",
            ).onlyPadding(top: 10.h),
          ],
        ),
      ),
    );
  }
}
