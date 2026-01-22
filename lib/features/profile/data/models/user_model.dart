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
      name: json[AppConstants.fullName],
      email: json[AppConstants.email],
      phoneNumber: json[AppConstants.mobileNumber],
      birthDay: json[AppConstants.birthDay],
      activeOrders: [],
      cancelOrders: [],
      completedOrders: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': name,
      'email': email,
      "birth_date": birthDay,
      "mobile_number": phoneNumber,
      'active_orders': activeOrders.map((e) => e.toJson()).toList(),
      'cancelled_orders': cancelOrders.map((e) => e.toJson()).toList(),
      'completed_orders': completedOrders.map((e) => e.toJson()).toList(),
    };
  }
}
