import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../data/consts/payment_methods.dart';

class PaymentMethodContainer extends StatelessWidget {
  final int index;
  final int selectedIndex;

  const PaymentMethodContainer({
    super.key,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: AppBoxDecoration.welcomeButton(
        selectedIndex == index
            ? AppColors.splashColor.withAlpha(500)
            : AppColors.splashColor.withAlpha(100),
      ),
      child: RadioListTile(
        toggleable: true,
        value: index,
        activeColor: AppColors.welcomeColor,
        secondary: SvgPicture.asset(
          paymentMethods[index].icon,
          width: 30.w,
          colorFilter: ColorFilter.mode(
            selectedIndex == index ? AppColors.welcomeColor : Colors.black,
            BlendMode.srcIn,
          ),
        ),
        title: Text(
          paymentMethods[index].name,
          style: AppTextStyles.textFtS15FW500.copyWith(
            color: selectedIndex == index ? AppColors.welcomeColor : Colors.black,
          ),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
        // radioSide: BorderSide(
        //     strokeAlign: BorderSide.strokeAlignOutside),
      ),
    );
  }
}
