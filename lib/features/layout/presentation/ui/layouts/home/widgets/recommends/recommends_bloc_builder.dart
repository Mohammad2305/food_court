import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../manager/home_cubit/home_cubit.dart';
import 'recommend_grid_list.dart';

class RecommendsBlocBuilder extends StatelessWidget {
  const RecommendsBlocBuilder({super.key});

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
            child: RecommendGridList(),
          );
        }
        if (state is HomeError) {
          return Text(state.message, style: const TextStyle(color: Colors.red));
        }
        if (state is HomeSuccessful) {
          return RecommendGridList(products: state.recommends,);
        }
        return const SizedBox();
      },
    );
  }
}
