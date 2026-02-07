import 'package:food_court/cores/utils/extensions/strings.dart';
import 'package:food_court/features/orders/data/models/order_state_model.dart';
import 'package:food_court/features/orders/presentation/ui/pages/orders/layouts/cancelled_orders/cancelled_orders_layout.dart';
import 'package:food_court/features/orders/presentation/ui/pages/orders/layouts/completed_orders/completed_orders_layout.dart';
import 'package:food_court/features/profile/data/models/user_model.dart';
import '../../../../cores/utils/constants/app_constants.dart';
import '../../presentation/ui/pages/orders/layouts/active_orders/active_orders_layout.dart';

List<OrderStateModel> orderStates({UserModel? user}) => [
  OrderStateModel(
    state: AppConstants.activeOrders.firstCharacterUpper,
    orderList: ActiveOrdersLayout(user: user,),
  ),
  OrderStateModel(
    state: AppConstants.completedOrders.firstCharacterUpper,
    orderList: CompletedOrdersLayout(user: user,),
  ),
  OrderStateModel(
    state: AppConstants.cancelledOrders.firstCharacterUpper,
    orderList: CancelledOrdersLayout(user: user,),
  ),
];
