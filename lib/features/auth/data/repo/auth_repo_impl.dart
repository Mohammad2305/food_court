import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_court/features/auth/domain/repo/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl extends AuthRepo {
  // create account with using email and password and some personal information
  @override
  createAccountWithEmailAndPassword({
    required String fullName,
    required String password,
    required String email,
    required String mobileNumber,
    required String birthDate,
  }) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseFirestore.instance.collection("users").add({
        "full_name": fullName,
        "email": email.trim(),
        "mobile_number": mobileNumber,
        "birth_date": birthDate,
        "image": null,
        "orders": {"active": [], "completed": [], "cancelled": []},
        "addresses": [],
        "payment_methods": [],
      });
      final user = userCredential.user;
      if(user!=null && !user.emailVerified){
        await userCredential.user?.sendEmailVerification();
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return e;
    }
  }

  // sign in to saved account with using email and password
  @override
  signInWithEmailAndPassword({
    required String password,
    required String email,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      if(!FirebaseAuth.instance.currentUser!.emailVerified){
        await credential.user?.sendEmailVerification();
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        return 'Email format is invalid';
      } else if (e.code == 'user-disabled') {
        return 'User account is disabled';
      } else if (e.code == 'too-many-requests') {
        return 'Too many attempts, temporarily blocked';
      } else if (e.code == 'invalid-credential') {
        return 'Email or password is wrong';
      }
    } catch (e) {
      return e;
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
  signInWithGoogle() async{
    try{
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();
      final GoogleSignInAuthentication googleSignInAuthentication = googleUser.authentication;
      final OAuthCredential googleAuthProvider = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(googleAuthProvider);
      return userCredential;
    }
    on FirebaseException catch(e){
      switch (e.code) {
        case 'account-exists-with-different-credential':
          return 'Account exists with another sign-in method';
        case 'invalid-credential':
          return 'Invalid Google credentials';
        case 'operation-not-allowed':
          return 'Google sign-in is disabled';
        case 'user-disabled':
          return 'This account has been disabled';
        case 'network-request-failed':
          return 'Check your internet connection';
        default:
          return 'Google sign-in failed';
      }
    }
    catch(e){
      return e;
    }
  }
}
