part of 'profile_data_cubit.dart';

@immutable
sealed class ProfileDataState {}

final class ProfileDataInitial extends ProfileDataState {}

final class ProfileDataLoading extends ProfileDataState {}

final class ProfileDataSuccessful extends ProfileDataState {
  final UserModel user;
  ProfileDataSuccessful(this.user);
}

final class ProfileDataError extends ProfileDataState {
  final String message;
  ProfileDataError(this.message);
}

final class UpdateProfileDataLoading extends ProfileDataState {}

final class UpdateProfileDataSuccessful extends ProfileDataState {}

final class UpdateProfileDataError extends ProfileDataState {
  final String message;
  UpdateProfileDataError(this.message);
}
