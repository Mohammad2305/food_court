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

  emailVerify({required User user});

}
