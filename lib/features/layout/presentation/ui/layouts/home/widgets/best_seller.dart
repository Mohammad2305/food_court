import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/cores/utils/extensions/main_app.dart';
import 'package:food_court/features/layout/presentation/ui/layouts/home/widgets/best_sellers_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../manager/home_cubit/home_cubit.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Best Seller", style: AppTextStyles.textFtS20FW500),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "View All",
                    style: AppTextStyles.textFtS12FW500.copyWith(
                      color: AppColors.welcomeColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.welcomeColor,
                    size: 15.r,
                  ),
                ],
              ),
            ),
          ],
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is ProductsDataGetLoading) {
              return Skeletonizer(
                effect: PulseEffect(
                    from: AppColors.splashColor,
                    to: AppColors.splashColor.withAlpha(100)
                ),
                child: BestSellersList(),
              );
            }
            if (state is ProductsDataGetError) {
              return Text(state.error, style: const TextStyle(color: Colors.red));
            }
            if (state is ProductsDataGetSuccessful) {
              return BestSellersList(products: state.productModel,);
            }
            return const SizedBox();
          },
        ).sized(vertical: 120.h),
      ],
    );
  }
}
