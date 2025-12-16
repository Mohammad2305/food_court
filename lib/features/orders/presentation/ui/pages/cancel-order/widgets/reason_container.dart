import 'package:flutter/material.dart';
import '../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../data/consts/cancel_reasons.dart';

class ReasonContainer extends StatelessWidget {
  final int index;
  final int selectedIndex;

  const ReasonContainer({
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
        title: Text(
          cancelReasons[index],
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
