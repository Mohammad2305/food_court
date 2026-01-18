import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../domain/repo/auth_repo.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo authRepo;
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  forgetPassword({required String email}) async{
    emit(ForgetPasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      emit(ForgetPasswordSuccessful());
    } on FirebaseAuthException catch (e) {
      String error ;
      switch (e.code) {
        case 'invalid-email':
          error = 'Invalid email address';
        case 'user-not-found':
        // Security best practice
          error = 'If an account exists, a reset link has been sent';
        case 'missing-email':
          error = 'Email cannot be empty';
        case 'too-many-requests':
          error = 'Too many requests. Try again later';
        case 'network-request-failed':
          error = 'Check your internet connection';
        default:
          error = 'Failed to send reset email';
      }
      emit(ForgetPasswordError(error));
    } catch (e) {
      emit(ForgetPasswordError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    password.dispose();
    confirmPassword.dispose();
    email.dispose();
    return super.close();
  }
}
