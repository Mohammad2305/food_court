import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_court/features/layout/presentation/manager/home_cubit/home_cubit.dart';
import 'package:food_court/features/layout/presentation/ui/layouts/home/widgets/ads_discounts/ads_discounts_container.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../../cores/utils/constants/app_colors.dart';

class AdsCenter extends StatelessWidget {
  const AdsCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return Skeletonizer(
            effect: PulseEffect(
                from: AppColors.splashColor,
                to: AppColors.splashColor.withAlpha(100)
            ),
            child: AdsDiscountsContainer(),
          );
        }
        if (state is HomeError) {
          return Text(state.message, style: const TextStyle(color: Colors.red));
        }
        if (state is HomeSuccessful) {
          return AdsDiscountsContainer(products: state.adsDiscounts,);
        }
        return const SizedBox();
      },
    );
  }
}