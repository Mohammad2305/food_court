import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
      FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user?.uid)
          .set({
            "full_name": fullName,
            "email": email.trim(),
            "mobile_number": mobileNumber,
            "birth_date": birthDate,
            "image": null,
            "orders": {"active": [], "completed": [], "cancelled": []},
            "addresses": [],
          });
      // final user = userCredential.user;
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

  @override
  phoneNumberVerify() {}

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
      // final user = credential.user;
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
  emailVerify({required User? user}) async {
    if (user != null && !user.emailVerified) {
      await user.reload();
      await user.sendEmailVerification();
    }
  }

  @override
  forgetPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
  }

  @override
  resetPassword({required String newPassword, required User user}) async {
    await user.updatePassword(newPassword);
  }

  @override
  signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
    on FirebaseException catch (e) {
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
    } catch (e) {
      return e;
    }
  }

  @override
  signInWithGoogle() async {
    try {
      // 1️⃣ Start Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User cancelled
        return null;
      }

      // 2️⃣ Get auth details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // 3️⃣ Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4️⃣ Sign in to Firebase
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      final user = userCredential.user!;
      final uid = user.uid;

      // 5️⃣ Create user doc ONLY if it doesn't exist
      final userDoc = FirebaseFirestore.instance.collection("users").doc(uid);

      final docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        await userDoc.set({
          "full_name": user.displayName ?? "No Name",
          "email": user.email,
          "mobile_number": user.phoneNumber,
          "image": user.photoURL,
          "orders": {"active": [], "completed": [], "cancelled": []},
          "addresses": [],
          "created_at": FieldValue.serverTimestamp(),
        });
      }

      return userCredential;
    } on FirebaseException catch (e) {
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
    } catch (e) {
      return e;
    }
  }
}
