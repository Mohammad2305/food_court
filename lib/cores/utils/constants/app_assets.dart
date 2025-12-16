String mainPath = "assets/images";
String svgPath = "$mainPath/svg";
String pngPath = "$mainPath/png";

class AppAssets{
  // splash screen
  static final String splash = "$svgPath/logo.svg";

  // welcome screen
  static final String welcome = "$svgPath/welcome.svg";

  // onboarding screen
  static final String orderIcon = "$svgPath/onboarding/order_icon.svg";
  static final String paymentIcon = "$svgPath/onboarding/card_icon.svg";
  static final String deliveryIcon = "$svgPath/onboarding/deliver_boy_icon.svg";
  static final String orderImg = "$pngPath/orders_img.png";
  static final String paymentImg = "$pngPath/payment_img.png";
  static final String deliveryImg = "$pngPath/delivery_img.png";

  // auth screen
  static final String gmailIcon = "$svgPath/auth/gmail.svg";
  static final String facebookIcon = "$svgPath/auth/facebook.svg";
  static final String fingerPrintIcon = "$svgPath/auth/fingerprint.svg";
  static final String fingerPrintGreyBig = "$svgPath/auth/fingerprint_big.svg";
  static final String fingerPrintBig = "$svgPath/auth/fingerprint_big_colored.svg";
  static final String closeEye = "$svgPath/auth/closed_eye.svg";
  static final String openEye = "$svgPath/auth/open_eye.svg";

  // layout screens
  static final String homeIcon = "$svgPath/layout/general/home.svg";
  static final String dinnerIcon = "$svgPath/layout/general/dinner.svg";
  static final String loveIcon = "$svgPath/layout/general/love.svg";
  static final String menuIcon = "$svgPath/layout/general/menu.svg";
  static final String callCenterIcon = "$svgPath/layout/general/call_center.svg";
  static final List<String> navigators = [
    AppAssets.homeIcon,
    AppAssets.dinnerIcon,
    AppAssets.loveIcon,
    AppAssets.menuIcon,
    AppAssets.callCenterIcon,
  ];

  // layout screens => *home screen*
  static final String cartIcon = "$svgPath/layout/home/cart.svg";
  static final String notificationIcon = "$svgPath/layout/home/notification.svg";
  static final String profileIcon = "$svgPath/layout/home/profile.svg";
  static final String searchIcon = "$svgPath/layout/home/search.svg";
  static final String desserts = "$svgPath/layout/home/desserts.svg";
  static final String drinks = "$svgPath/layout/home/drinks.svg";
  static final String meals = "$svgPath/layout/home/meals.svg";
  static final String snacks = "$svgPath/layout/home/snacks.svg";
  static final String vegan = "$svgPath/layout/home/vegan.svg";

  // profile screens
  static final String shoppingIcon = "$svgPath/profile/bag.svg";
  static final String locationIcon = "$svgPath/profile/address.svg";
  static final String contactIcon = "$svgPath/profile/contacts.svg";
  static final String helpIcon = "$svgPath/profile/help.svg";
  static final String settingIcon = "$svgPath/profile/settings.svg";
  static final String logoutIcon = "$svgPath/profile/logout.svg";

  // profile screens => *orders screen*
  static final String emptyList = "$svgPath/orders/empty_list.svg";
  static final String closeCircleIcon = "$svgPath/orders/close_circle.svg";
  static final String successCancelled = "$svgPath/orders/success_cancel.svg";
  static final String outlineStar = "$svgPath/orders/outline_star.svg";
  static final String filledStar = "$svgPath/orders/filled_star.svg";

  // profile screens => *account screen*
  static final String camera = "$svgPath/account/cam.svg";

  // profile screens => *address screen*
  static final String address = "$svgPath/address/address.svg";
}