import 'package:bloc/bloc.dart';
import 'package:food_court/features/profile/data/models/user_model.dart';
import 'package:meta/meta.dart';
import '../../domain/repo/profile_repo.dart';
part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileRepo profileRepo ;
  ProfileDataCubit(this.profileRepo) : super(ProfileDataInitial());

  Future<void> getUserData() async {
    emit(ProfileDataLoading());

    try {
      final user = await profileRepo.getUserData();

      if (user == null) {
        emit(ProfileDataError('User data not found'));
      } else {
        emit(ProfileDataSuccessful(user));
      }
    } catch (e) {
      emit(ProfileDataError(e.toString()));
    }
  }
}
