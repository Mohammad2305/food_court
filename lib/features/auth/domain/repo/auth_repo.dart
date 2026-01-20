import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  createAccountWithEmailAndPassword({
    required String fullName,
    required String password,
    required String email,
    required String mobileNumber,
    required String birthDate,
  });

  signInWithEmailAndPassword({required String password, required String email});

  signInWithGoogle();

  signInWithFacebook();


  emailVerify({required User user});

  phoneNumberVerify();

  forgetPassword({required String email});

  resetPassword({required String newPassword, required User user});
}
