import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/consts/addresses.dart';
import '../../../../manager/delivery_address_cubit.dart';
import 'address_container.dart';

class YourAddresses extends StatelessWidget {
  final int selected;
  const YourAddresses({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioGroup(
        onChanged: (value) {
          context.read<DeliveryAddressCubit>().changeValue(value ?? 0);
        },
        groupValue: selected,
        child: ListView.separated(
          clipBehavior: Clip.antiAlias,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return AddressContainer(
              index: index,
              selectedIndex: selected,
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemCount: addresses.length,
        ),
      ),
    );
  }
}
