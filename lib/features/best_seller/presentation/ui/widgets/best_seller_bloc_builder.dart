import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/features/best_seller/presentation/ui/widgets/best_seller_gridview.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../../../../cores/utils/extensions/main_app.dart';
import '../../manager/best_seller_cubit.dart';


class BestSellerBlocBuilder extends StatelessWidget {
  const BestSellerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerLoading) {
          return Skeletonizer(
            effect: PulseEffect(
                from: AppColors.splashColor,
                to: AppColors.splashColor.withAlpha(100)
            ),
            child: BestSellerGridview(),
          );
        }
        if (state is BestSellerError) {
          return Text(state.message, style: const TextStyle(color: Colors.red));
        }
        if (state is BestSellerSuccessful) {
          return BestSellerGridview(products: state.bestSeller,);
        }
        return const SizedBox();
      },
    );
  }
}
