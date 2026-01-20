import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_court/cores/utils/constants/app_constants.dart';
import 'package:food_court/features/profile/domain/repo/profile_repo.dart';
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

    if (!doc.exists || doc.data() == null) return null;

    return UserModel.fromJson(doc.data()!);
  }
}