import 'package:food_court/cores/utils/constants/app_assets.dart';

class OnboardingPage {
  OnboardingPage({
    required this.pageImage,
    required this.pageIcon,
    required this.pageTitle,
    required this.pageDescription,
  });

  final String pageImage;
  final String pageIcon;
  final String pageTitle;
  final String pageDescription;
}

List<OnboardingPage> onboarding = [
  OnboardingPage(
    pageImage: AppAssets.orderImg,
    pageIcon: AppAssets.orderIcon,
    pageTitle: "Order for Food",
    pageDescription: "Your order has been received and the restaurant has started preparing it.",
  ),
  OnboardingPage(
    pageImage: AppAssets.paymentImg,
    pageIcon: AppAssets.paymentIcon,
    pageTitle: "Easy Payment",
    pageDescription: "Choose from multiple payment options and complete your order smoothly.",
  ),
  OnboardingPage(
    pageImage: AppAssets.deliveryImg,
    pageIcon: AppAssets.deliveryIcon,
    pageTitle: "Fast Delivery",
    pageDescription: "Our delivery partners ensure your order reaches you on time, every time.",
  ),
];
