import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/extensions/aligns.dart';
import 'package:food_court/cores/utils/extensions/paddings.dart';
import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/layout/presentation/ui/layouts/home/widgets/recommend_grid_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../../../../cores/shared/themes/app_text_styles.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../manager/home_cubit/home_cubit.dart';

class RecommendList extends StatelessWidget {
  const RecommendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "recommend".firstCharacterUpper,
          style: AppTextStyles.textFtS20FW500,
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is RecommendsProductsDataGetLoading) {
              return Skeletonizer(
                effect: PulseEffect(
                    from: AppColors.splashColor,
                    to: AppColors.splashColor.withAlpha(100)
                ),
                child: RecommendGridList(),
              );
            }
            if (state is RecommendsProductsDataGetError) {
              return Text(state.error, style: const TextStyle(color: Colors.red));
            }
            if (state is RecommendsProductsDataGetSuccessful) {
              return RecommendGridList(products: state.productModel,);
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
