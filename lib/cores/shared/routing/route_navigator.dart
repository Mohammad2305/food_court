import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_court/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:food_court/features/auth/presentation/manager/platform_auth/platform_auth_cubit.dart';
import 'package:food_court/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:food_court/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:food_court/features/auth/presentation/ui/pages/forget_password/forget_password_screen.dart';
import 'package:food_court/features/best_seller/presentation/manager/best_seller_cubit.dart';
import 'package:food_court/features/best_seller/presentation/ui/best_seller_screen.dart';
import 'package:food_court/features/delivery_address/presentation/manager/delivery_address_cubit.dart';
import 'package:food_court/features/layout/data/repo/product_data_repo_impl.dart';
import 'package:food_court/features/layout/presentation/manager/home_cubit/home_cubit.dart';
import 'package:food_court/features/product/presentation/ui/product_screen.dart';
import 'package:food_court/features/profile/data/repo/profile_repo_impl.dart';
import 'package:food_court/features/profile/presentation/manager/profile_data_cubit.dart';
import '../../../features/account/presentation/ui/account_screen.dart';
import '../../../features/auth/data/repo/auth_repo_impl.dart';
import '../../../features/auth/presentation/ui/pages/login/login_screen.dart';
import '../../../features/auth/presentation/ui/pages/register/register_screen.dart';
import '../../../features/auth/presentation/ui/pages/set_password/set_password_screen.dart';
import '../../../features/delivery_address/presentation/ui/pages/addresses_list/address_list_screen.dart';
import '../../../features/delivery_address/presentation/ui/pages/new_address/new_address_screen.dart';
import '../../../features/layout/data/models/product_model.dart';
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
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => RegisterCubit(AuthRepoImpl())),
              BlocProvider(
                create: (context) => PlatformAuthCubit(AuthRepoImpl()),
              ),
            ],
            child: RegisterScreen(),
          ),
        );
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => LoginCubit(AuthRepoImpl())),
              BlocProvider(
                create: (context) => PlatformAuthCubit(AuthRepoImpl()),
              ),
            ],
            child: LoginScreen(),
          ),
        );
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ResetPasswordCubit(AuthRepoImpl()),
            child: ForgetPasswordScreen(),
          ),
        );
      case AppRoutes.setPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ResetPasswordCubit(AuthRepoImpl()),
            child: SetPasswordScreen(),
          ),
        );
      // Layout Screens
      case AppRoutes.layoutScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(ProductDataRepoImpl())..loadData(),
            child: LayoutScreen(),
          ),
        );
      case AppRoutes.bestSellerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                BestSellerCubit(ProductDataRepoImpl())..loadBestSellerData(),
            child: BestSellerScreen(),
          ),
        );
      case AppRoutes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProfileDataCubit(ProfileRepoImpl())..getUserData(),
            child: ProfileScreen(),
          ),
        );
      case AppRoutes.productScreen:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(builder: (_) => ProductScreen(product: product,));
      // Layout Screens => *profile screen*
      // Layout Screens => *profile screen* => *order screen*
      case AppRoutes.ordersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<OrdersCubit>(
            create: (context) => OrdersCubit(),
            child: BlocProvider(
              create: (context) =>
                  ProfileDataCubit(ProfileRepoImpl())..getUserData(),
              child: OrdersScreen(),
            ),
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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProfileDataCubit(ProfileRepoImpl())..getUserData(),
            child: AccountScreen(),
          ),
        );
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
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('There are some Errors')),
          ),
        );
    }
  }
}
