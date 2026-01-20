part of 'platform_auth_cubit.dart';

@immutable
sealed class PlatformAuthState {}

final class PlatformAuthInitial extends PlatformAuthState {}

final class GoogleAuthLoading extends PlatformAuthState {}

final class GoogleAuthSuccessful extends PlatformAuthState {}

final class GoogleAuthError extends PlatformAuthState {
  final String error;
  GoogleAuthError({required this.error});
}

final class FaceBookAuthLoading extends PlatformAuthState {}

final class FaceBookAuthSuccessful extends PlatformAuthState {}

final class FaceBookAuthError extends PlatformAuthState {
  final String error;
  FaceBookAuthError({required this.error});
}