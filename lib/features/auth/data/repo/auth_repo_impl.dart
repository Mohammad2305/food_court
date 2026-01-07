import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_court/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  // create account with using email and password and some personal information
  @override
  createAccountWithEmailAndPassword({
    required String fullName,
    required String password,
    required String email,
    required String mobileNumber,
    required DateTime birthDate,
  }) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  // sign in to saved account with using email and password
  @override
  signInWithEmailAndPassword({
    required String password,
    required String email,
  }) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      return null;
    } catch(e) {
      return null;
    }
  }

  @override
  signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  signInWithFingerPrint() {
    // TODO: implement signInWithFingerPrint
    throw UnimplementedError();
  }

  @override
  signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
