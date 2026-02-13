import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_court/features/cart/presentation/ui/widgets/cart_listview.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../cores/shared/themes/app_boxes_decoration.dart';
import '../../../../../cores/utils/constants/app_assets.dart';
import '../../../../../cores/utils/constants/app_colors.dart';
import '../../../../layout/presentation/ui/layouts/home/widgets/recommends/recommend_grid_list.dart';
import '../../../../layout/presentation/ui/layouts/home/widgets/recommends/recommends_item_info.dart';
import '../../../../profile/presentation/manager/profile_data_cubit.dart';


class CartBlocBuilder extends StatelessWidget {
  const CartBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        if (state is CartLoadingState) {
          return Skeletonizer(
            effect: PulseEffect(
                from: AppColors.splashColor,
                to: AppColors.splashColor.withAlpha(100)
            ),
            child: CartListview(),
          );
        }
        if (state is CartErrorState) {
          return Text(state.error??"", style: const TextStyle(color: Colors.red));
        }
        if (state is CartSuccessfulState) {
          return CartListview(cart: state.cart,);
        }
        return const SizedBox();
      },
    );
  }
}
