import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_court/features/delivery_address/presentation/manager/delivery_address_cubit.dart';
import 'package:food_court/features/payment/presentation/manager/payment_cubit.dart';
import 'package:food_court/features/payment/presentation/ui/pages/add_card/add_card_screen.dart';
import 'package:food_court/features/payment/presentation/ui/pages/methods/methods_screen.dart';
import '../../../features/account/presentation/ui/account_screen.dart';
import '../../../features/auth/presentation/ui/pages/finger_print_set/finger_print_set_screen.dart';
import '../../../features/auth/presentation/ui/pages/login/login_screen.dart';
import '../../../features/auth/presentation/ui/pages/register/register_screen.dart';
import '../../../features/auth/presentation/ui/pages/set_password/set_password_screen.dart';
import '../../../features/delivery_address/presentation/ui/pages/addresses_list/address_list_screen.dart';
import '../../../features/delivery_address/presentation/ui/pages/new_address/new_address_screen.dart';
import '../../../features/layout/presentation/ui/layouts/layout/layout_screen.dart';
import '../../../features/onboarding/presentation/ui/onboarding_screen.dart';
import '../../../features/orders/presentation/manager/orders_cubit.dart';
import '../../../features/orders/presentation/ui/pages/cancel-order/cancel_order_screen.dart';
import '../../../features/orders/presentation/ui/pages/order_review/order_review_screen.dart';
import '../../../features/orders/presentation/ui/pages/orders/orders_screen.dart';
import '../../../features/orders/presentation/ui/pages/success_cancel/success_cancel_screen.dart';
import '../../../features/profile/presentation/ui/profile_screen.dart';
import '../../../features/splash/presentation/ui/splash_screen.dart';
import '../../../features/welcome/presentation/ui/welcome_screen.dart';
import 'app_routes.dart';

class RouteNavigator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash Screen
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // Onboarding Screen
      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      // Welcome Screen
      case AppRoutes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      // Auth Screens
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.setPasswordScreen:
        return MaterialPageRoute(builder: (_) => const SetPasswordScreen());
      case AppRoutes.setFingerPrintScreen:
        return MaterialPageRoute(builder: (_) => const FingerPrintSetScreen());
      // Layout Screens
      case AppRoutes.layoutScreen:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case AppRoutes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      // Layout Screens => *profile screen*
      // Layout Screens => *profile screen* => *order screen*
      case AppRoutes.ordersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<OrdersCubit>(
            create: (context) => OrdersCubit(),
            child: OrdersScreen(),
          ),
        );
      case AppRoutes.cancelOrdersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OrdersCubit>(
            create: (context) => OrdersCubit(),
            child: const CancelOrderScreen(),
          ),
        );
      case AppRoutes.successCancelScreen:
        return MaterialPageRoute(builder: (_) => const SuccessCancelScreen());
      case AppRoutes.orderReviewScreen:
        return MaterialPageRoute(builder: (_) => const OrderReviewScreen());
      // Layout Screens => *profile screen* => *account screen*
      case AppRoutes.accountScreen:
        return MaterialPageRoute(builder: (_) => const AccountScreen());
      // Layout Screens => *profile screen* => *account screen*
      case AppRoutes.addressListScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<DeliveryAddressCubit>(
            create: (context) => DeliveryAddressCubit(),
            child: AddressListScreen(),
          ),
        );
      case AppRoutes.newAddressScreen:
        return MaterialPageRoute(builder: (_) => const NewAddressScreen());
      // Layout Screens => *profile screen* => *payment screen*
      case AppRoutes.methodsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PaymentCubit>(
            create: (context) => PaymentCubit(),
            child: MethodsScreen(),
          ),
        );
      case AppRoutes.addCardScreen:
        return MaterialPageRoute(builder: (_) => const AddCardScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('There are some Errors')),
          ),
        );
    }
  }
}
