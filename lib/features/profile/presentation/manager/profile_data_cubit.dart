import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_court/cores/utils/constants/app_assets.dart';
import 'package:food_court/features/profile/data/models/user_model.dart';
import 'package:meta/meta.dart';
import '../../domain/repo/profile_repo.dart';
part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileRepo profileRepo;

  ProfileDataCubit(this.profileRepo) : super(ProfileDataInitial());

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController date = TextEditingController();
  String image = AppAssets.noImageProfile;

  Future<UserModel?> getUserData() async {
    emit(ProfileDataLoading());
    try {
      final user = await profileRepo.getUserData();

      if (user == null) {
        emit(ProfileDataError('User data not found'));
        return null;
      } else {
        emit(ProfileDataSuccessful(user));
        name.text = user.name;
        email.text = user.email;
        mobile.text = user.phoneNumber;
        date.text = user.birthDay;
        image = user.image ?? AppAssets.noImageProfile;
        return user;
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(ProfileDataError(e.toString()));
    }
    return null;
  }

  Future<void> updateUserDate() async {
    emit(UpdateProfileDataLoading());
    try {
      await profileRepo.updateUserData(
        fullName: name.text,
        birthDay: date.text,
        email: email.text,
        phoneNumber: mobile.text,
      );
      await getUserData();
      emit(UpdateProfileDataSuccessful());
    } catch (e) {
      emit(UpdateProfileDataError(e.toString()));
    }
  }

  Future<String?> uploadToCloudinary({required File imageFile}) async {
    emit(ImageChangeDataLoading());
    try {
      final imageUrl = await profileRepo.uploadToCloudinary(imageFile: imageFile);
      if (imageUrl == null) {
        emit(ImageChangeDataError("Upload failed"));
        return null;
      }

      debugPrint("________________________________________________________________");
      debugPrint('Cloudinary URL: $imageUrl');
      debugPrint("________________________________________________________________");

      image = imageUrl;
      await saveImageUrlToFirebase(imageUrl);
      await updateUserDate();

      emit(ImageChangeDataSuccessful(image));
    } catch (e) {
      emit(ImageChangeDataError(e.toString()));
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  Future<void> saveImageUrlToFirebase(String imageUrl) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'image': imageUrl,
    });

    debugPrint('Saved to Firestore successfully');
  }

  @override
  Future<void> close() {
    name.dispose();
    mobile.dispose();
    date.dispose();
    email.dispose();
    return super.close();
  }
}
