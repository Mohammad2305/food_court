import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/cores/utils/constants/app_constants.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';

class UserModel {
  final String name;
  final String email;
  final String? image;
  final String phoneNumber;
  final String birthDay;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.birthDay,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[AppConstants.fullName]?.toString() ?? '',
      email: json[AppConstants.email]?.toString() ?? '',
      phoneNumber: json[AppConstants.mobileNumber]?.toString() ?? '',
      image: json[AppConstants.image]?.toString() ?? AppAssets.noImageProfile,
      birthDay: json[AppConstants.birthDay]?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': name,
      'email': email,
      "birth_date": birthDay,
      "mobile_number": phoneNumber,
      "image": image,
    };
  }
}
