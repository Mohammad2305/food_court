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

  signInWithFingerPrint();
}
