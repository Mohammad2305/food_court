import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/constants/app_constants.dart';

class UserModel {
  final String name;
  final String email;
  final String? image;
  final String phoneNumber;
  final String birthDay;
  final List activeOrders;
  final List cancelOrders;
  final List completedOrders;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.birthDay,
    required this.activeOrders,
    required this.cancelOrders,
    required this.completedOrders,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[AppConstants.fullName]?.toString() ?? '',
      email: json[AppConstants.email]?.toString() ?? '',
      phoneNumber: json[AppConstants.mobileNumber]?.toString() ?? '',
      image: json[AppConstants.image]?.toString() ?? AppAssets.noImageProfile,
      birthDay: json[AppConstants.birthDay]?.toString() ?? '',
      activeOrders: List<String>.from(json['activeOrders'] ?? []),
      cancelOrders: List<String>.from(json['cancelOrders'] ?? []),
      completedOrders: List<String>.from(json['completedOrders'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': name,
      'email': email,
      "birth_date": birthDay,
      "mobile_number": phoneNumber,
      "image": image,
      'active_orders': activeOrders.map((e) => e.toJson()).toList(),
      'cancelled_orders': cancelOrders.map((e) => e.toJson()).toList(),
      'completed_orders': completedOrders.map((e) => e.toJson()).toList(),
    };
  }
}
