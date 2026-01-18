part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ForgetPasswordInitial extends ResetPasswordState {}

final class ForgetPasswordLoading extends ResetPasswordState {}

final class ForgetPasswordSuccessful extends ResetPasswordState {}

final class ForgetPasswordError extends ResetPasswordState {
  final String error;
  ForgetPasswordError(this.error);
}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccessful extends ResetPasswordState {}

final class ResetPasswordError extends ResetPasswordState {
  final String error;
  ResetPasswordError(this.error);
}