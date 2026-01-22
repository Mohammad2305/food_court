import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../cores/shared/ui/widgets/general_app_bar.dart';
import '../../../../../../cores/shared/ui/widgets/screen_layout.dart';
import '../../../../../../cores/utils/constants/app_colors.dart';
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
                  child: orderStates[context.watch<OrdersCubit>().currentIndex]
                      .orderList,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
