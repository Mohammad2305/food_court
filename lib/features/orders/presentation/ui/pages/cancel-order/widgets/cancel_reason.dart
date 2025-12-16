import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/orders/presentation/ui/pages/cancel-order/widgets/reason_container.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_input.dart';
import '../../../../manager/orders_cubit.dart';

class CancelReasons extends StatelessWidget {
  final int selected;

  const CancelReasons({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioGroup(
          groupValue: context.read<OrdersCubit>().value,
          onChanged: (value) {
            if (value != context.read<OrdersCubit>().value) {
              context.read<OrdersCubit>().changeValue(value ?? 0);
            }
          },
          child: Column(
            spacing: 10.h,
            children: [
              ReasonContainer(selectedIndex: selected, index: 0),
              ReasonContainer(selectedIndex: selected, index: 1),
              ReasonContainer(selectedIndex: selected, index: 2),
              ReasonContainer(selectedIndex: selected, index: 3),
              ReasonContainer(selectedIndex: selected, index: 4),
            ],
          ).onlyPadding(bottom: 23.h),
        ),
        CustomInput(
          inputTitle: "others".firstCharacterUpper,
        ).onlyPadding(bottom: 30.h),
      ],
    );
  }
}
