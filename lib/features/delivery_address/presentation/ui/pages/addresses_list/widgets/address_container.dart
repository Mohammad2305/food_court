import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/features/delivery_address/data/consts/addresses.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';

class AddressContainer extends StatelessWidget {
  final int index;
  final int selectedIndex;

  const AddressContainer({
    super.key,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          AppAssets.address,
          width: 30.w,
          colorFilter: ColorFilter.mode(
            selectedIndex == index ? AppColors.welcomeColor : Colors.black,
            BlendMode.srcIn,
          ),
        ),
        title: Text(
          addresses[index].addressTitle,
          style: AppTextStyles.textFtS15FW500.copyWith(
            color: selectedIndex == index
                ? AppColors.welcomeColor
                : Colors.black,
          ),
        ),
        subtitle: Text(
          addresses[index].addressDescription,
          style: AppTextStyles.textFtS12FW300.copyWith(
            color: selectedIndex == index
                ? AppColors.welcomeColor
                : Colors.black,
          ),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
