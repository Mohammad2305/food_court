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

final class ImageChangeDataLoading extends ProfileDataState {}

final class ImageChangeDataSuccessful extends ProfileDataState {
  final String image;
  ImageChangeDataSuccessful(this.image);
}

final class ImageChangeDataError extends ProfileDataState {
  final String message;
  ImageChangeDataError(this.message);
}

final class IsFavoriteState extends ProfileDataState {}

final class IsNotFavoriteState extends ProfileDataState {}

final class FavoriteLoadingState extends ProfileDataState{}

final class FavoriteErrorState extends ProfileDataState{
  final String? error;
  FavoriteErrorState(this.error);
}

final class FavoritesDataLoading extends ProfileDataState {}

final class FavoritesDataSuccessful extends ProfileDataState {
  final List<ProductModel> favorites;
  FavoritesDataSuccessful(this.favorites);
}

final class FavoritesDataError extends ProfileDataState {
  final String message;
  FavoritesDataError(this.message);
}