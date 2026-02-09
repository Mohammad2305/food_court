import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_court/cores/utils/constants/app_constants.dart';
import 'package:food_court/features/layout/data/models/product_model.dart';
import 'package:food_court/features/profile/domain/repo/profile_repo.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<UserModel?> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    final doc = await FirebaseFirestore.instance
        .collection(AppConstants.usersCollection)
        .doc(user.uid)
        .get();

    debugPrint(doc.data().toString());
    return UserModel.fromJson(doc.data()!);
  }

  @override
  Future<void> updateUserData({
    required String fullName,
    required String birthDay,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      await FirebaseFirestore.instance
          .collection(AppConstants.usersCollection)
          .doc(user.uid)
          .update({
            AppConstants.fullName: fullName,
            AppConstants.birthDay: birthDay,
            AppConstants.email: email,
            AppConstants.mobileNumber: phoneNumber,
          });
    } catch (e) {
      debugPrint('updateUserData error: $e');
      rethrow;
    }
  }

  @override
  Future<String?> uploadToCloudinary({required File imageFile}) async {
    const cloudName = 'dkn7qb8dr';
    const uploadPreset = 'FoodCourt';

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload'),
    );

    request.fields['upload_preset'] = uploadPreset;
    request.files.add(
      await http.MultipartFile.fromPath('file', imageFile.path),
    );

    debugPrint("________________________________________________");
    debugPrint('Image path: ${imageFile.path}');
    debugPrint('File exists: ${imageFile.existsSync()}');
    debugPrint("________________________________________________");

    final response = await request.send();
    final resStr = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = jsonDecode(resStr);
      return data['secure_url']; // ✅ SUCCESS
    } else {
      debugPrint('Cloudinary upload failed');
      debugPrint('Status code: ${response.statusCode}');
      debugPrint('Response: $resStr');
      return null;
    }
  }

  @override
  Future<void> addProductToFavorites({required ProductModel? product}) async {
    // ✅ ADD TO FIREBASE
    await FirebaseFirestore.instance
        .collection(AppConstants.usersCollection)
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("favorites").doc(product?.productName).set(product!.toJson());
  }

  @override
  Future<void> removeProductToFavorites({
    required ProductModel? product,
    required dynamic snapshot,
  }) async {
    await snapshot.docs.first.reference.delete();
  }
}
