import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_court/cores/shared/themes/app_boxes_decoration.dart';
import 'package:food_court/cores/shared/ui/widgets/custom_button.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/product/presentation/manager/product_details_cubit.dart';
import 'package:food_court/features/product/presentation/ui/widgets/adds_bloc_builder.dart';
import 'package:food_court/features/product/presentation/ui/widgets/change_amount.dart';
import 'package:food_court/features/product/presentation/ui/widgets/product_additions_container.dart';
import 'package:food_court/features/product/presentation/ui/widgets/product_image_discount.dart';
import 'package:food_court/features/product/presentation/ui/widgets/product_price.dart';

class AddsBlocBuilder extends StatelessWidget {
  final String? addName;
  final double? addPrice;
  const AddsBlocBuilder({super.key, this.addName, this.addPrice});

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
            itemCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductAdditionsContainer(
                index: index,
                selectedIndex: context.read<ProductDetailsCubit>().value??0,
                productName: addName,
                productPrice: addPrice,
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: 5.h),
          ),
        );
      },
    );
  }
}
