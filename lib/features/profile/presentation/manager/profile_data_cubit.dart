import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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

  Future<void> getUserData() async {
    emit(ProfileDataLoading());
    try {
      final user = await profileRepo.getUserData();

      if (user == null) {
        emit(ProfileDataError('User data not found'));
      } else {
        emit(ProfileDataSuccessful(user));
        name.text = user.name;
        email.text = user.email;
        mobile.text = user.phoneNumber;
        date.text = user.birthDay;
      }
    } catch (e) {
      emit(ProfileDataError(e.toString()));
    }
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
}
