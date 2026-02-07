import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../cores/shared/ui/widgets/general_app_bar.dart';
import '../../../../../../cores/shared/ui/widgets/screen_layout.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';
import '../../../../../profile/presentation/manager/profile_data_cubit.dart';
import '../../../../data/consts/order_states.dart';
import '../../../manager/orders_cubit.dart';
import 'widgets/state_tab.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      appBar: GeneralAppBar(screenTitle: "My Orders"),
      body: ScreenLayout(
        padding: EdgeInsets.symmetric(vertical: 34.h, horizontal: 36.w),
        height: 750.h,
        child: BlocBuilder<OrdersCubit, OrdersState>(
          bloc: OrdersCubit(),
          builder: (context, state) {
            return BlocBuilder<ProfileDataCubit, ProfileDataState>(
              builder: (context, state) {
                if (state is ProfileDataLoading) {
                  return Skeletonizer(
                    effect: PulseEffect(
                      from: AppColors.splashColor,
                      to: AppColors.splashColor.withAlpha(100),
                    ),
                    child:
                        orderStates()[context.watch<OrdersCubit>().currentIndex]
                            .orderList,
                  );
                }
                if (state is ProfileDataError) {
                  return Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                if (state is ProfileDataSuccessful) {
                  final user = state.user;
                  return Column(
                    spacing: 10.h,
                    children: [
                      StateTab(
                        currentIndex: context.read<OrdersCubit>().currentIndex,
                        onTap: (index) {
                          context.read<OrdersCubit>().changeIndex(index);
                        },
                      ),
                      Expanded(
                        child: orderStates(
                          user: user,
                        )[context.watch<OrdersCubit>().currentIndex].orderList,
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
