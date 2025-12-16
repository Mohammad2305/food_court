import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/consts/payment_methods.dart';
import '../../../../manager/payment_cubit.dart';
import 'payment_method_container.dart';

class PaymentMethods extends StatelessWidget {
  final int selected;

  const PaymentMethods({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioGroup(
        onChanged: (value) {
          context.read<PaymentCubit>().changeValue(value ?? 0);
        },
        groupValue: selected,
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PaymentMethodContainer(
              index: index,
              selectedIndex: selected,
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemCount: paymentMethods.length,
        ),
      ),
    );
  }
}
