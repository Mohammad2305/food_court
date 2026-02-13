import 'dart:io';
import 'package:food_court/features/profile/data/models/user_model.dart';
import '../../../layout/data/models/product_model.dart';

abstract class ProfileRepo {
  Future<UserModel?> getUserData();

  Future<void> updateUserData({
    required String fullName,
    required String birthDay,
    required String email,
    required String phoneNumber,
  });

  Future<String?> uploadToCloudinary({required File imageFile});

  Future<void> addProductToFavorites({required ProductModel? product});

  Future<void> removeProductToFavorites({
    required ProductModel? product,
    required dynamic snapshot,
  });

  addProductCart({required ProductModel? product, required int? amount});

  changeAmountProductCart({
    required ProductModel? product,
    required int? newAmount,
    required dynamic snapshot,
});
}
