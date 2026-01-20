import 'package:food_court/features/profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<UserModel?> getUserData();
}