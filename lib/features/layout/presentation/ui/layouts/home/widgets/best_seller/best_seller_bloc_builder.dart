import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../../../../cores/utils/extensions/main_app.dart';
import '../../../../../manager/home_cubit/home_cubit.dart';
import 'best_sellers_list.dart';

class BestSellerBlocBuilder extends StatelessWidget {
  const BestSellerBlocBuilder({super.key});

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
            child: BestSellersList(),
          );
        }
        if (state is HomeError) {
          return Text(state.message, style: const TextStyle(color: Colors.red));
        }
        if (state is HomeSuccessful) {
          return BestSellersList(products: state.bestSeller,);
        }
        return const SizedBox();
      },
    ).sized(vertical: 120.h);
  }
}
