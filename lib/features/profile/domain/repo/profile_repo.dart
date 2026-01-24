import 'dart:io';
import 'package:food_court/features/profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<UserModel?> getUserData();

  Future<void> updateUserData({
    required String fullName,
    required String birthDay,
    required String email,
    required String phoneNumber,
  });

  Future<String?> uploadToCloudinary({required File imageFile});
}
