import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cores/shared/routing/app_routes.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../../layout/data/models/product_model.dart';
import '../../../../profile/presentation/manager/profile_data_cubit.dart';

class LovedBlocBuilder extends StatelessWidget {
  final ProductModel? product;
  const LovedBlocBuilder({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        final isFav = state is IsFavoriteState;
        return Positioned(
          left: 10.w,
          bottom: 10.h,
          child: Container(
            decoration: AppBoxDecoration.welcomeButton(AppColors.whiteText),
            child: IconButton(
              onPressed: () async {
                await context
                    .read<ProfileDataCubit>()
                    .changeProductFavorites(product: product);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.layoutScreen,
                      (_) => false,
                );
              },
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: AppColors.welcomeColor,
                size: 25.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}
