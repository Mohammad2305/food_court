import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import '../../../../../../../cores/shared/ui/widgets/custom_input.dart';

class NewAddressForm extends StatelessWidget {
  const NewAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 30.h,
        children: [
          CustomInput(inputTitle: "Name",),
          CustomInput(inputTitle: "Address",)
        ],
      ),
    ).onlyPadding(bottom: 110.h);
  }
}
