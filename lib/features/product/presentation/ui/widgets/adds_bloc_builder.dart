import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/features/product/presentation/manager/product_details_cubit.dart';
import 'package:food_court/features/product/presentation/ui/widgets/product_additions_container.dart';


class AddsBlocBuilder extends StatelessWidget {
  final List<String>? addChooses;
  final double? addPrice;
  const AddsBlocBuilder({super.key, this.addChooses, this.addPrice});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return RadioGroup(
          groupValue: context.read<ProductDetailsCubit>().value,
          onChanged: (value) {
            context.read<ProductDetailsCubit>().changeValue(value??0);
          },
          child: ListView.separated(
            itemCount: addChooses!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductAdditionsContainer(
                index: index,
                selectedIndex: context.read<ProductDetailsCubit>().value??0,
                productName: addChooses?[index],
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: 10.h),
          ),
        );
      },
    );
  }
}
