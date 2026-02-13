import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../../profile/presentation/manager/profile_data_cubit.dart';
import '../../home/widgets/recommends/recommend_grid_list.dart';

class FavoriteBlocBuilder extends StatelessWidget {
  const FavoriteBlocBuilder({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        if (state is ProfileDataLoading) {
          return Skeletonizer(
            effect: PulseEffect(
                from: AppColors.splashColor,
                to: AppColors.splashColor.withAlpha(100)
            ),
            child: RecommendGridList(),
          );
        }
        if (state is ProfileDataError) {
          return Text(state.message, style: const TextStyle(color: Colors.red));
        }
        if (state is FavoritesSuccessfulState) {
          return RecommendGridList(products: state.favorites,);
        }
        return const SizedBox();
      },
    );
  }
}
