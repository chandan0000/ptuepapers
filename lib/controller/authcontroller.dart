import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptuepapers/config/routes/routesname.dart';
import 'package:ptuepapers/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //! signUp with email and password

  void signUp(
      {required String email,
      required String cPassword,
      required BuildContext context}) async {
    try {
      if (email.isNotEmpty && cPassword.isNotEmpty) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
                email: email.trim(), password: cPassword.trim());
        if (userCredential.user != null) {
          GoRouter.of(context).go(RoutesName.bottomNavBar);
          Utils.snackBar(
              'You are succesfully Create Account', context, Colors.green);
        } else {
          Utils.snackBar('User not Created', context, Colors.red);
        }
      }
    } on FirebaseException catch (e) {
      Utils.snackBar(e.code, context, Colors.red);
    }
  }

//!login with email password
  void loginWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email.trim(), password: password.trim());
        if (userCredential.user != null) {
          GoRouter.of(context).go(RoutesName.bottomNavBar);
          Utils.snackBar('You are succesfully Login', context, Colors.green);
        } else {
          print('User not Login');
          Utils.snackBar('User not Login', context, Colors.red);
        }
      }
    } on FirebaseException catch (e) {
      Utils.snackBar(e.code, context, Colors.red);
    }
  }

//!forget password

  void forgetPassword(
      {required String email, required BuildContext context}) async {
    try {
      if (email.isNotEmpty) {
        await _auth.sendPasswordResetEmail(email: email.trim());

        Utils.snackBar('Password Reset Link Sent Please check Email', context,
            Colors.green);
      }
    } on FirebaseException catch (e) {
      Utils.snackBar(e.code, context, Colors.red);
    }
  }

  // ! google signout
  void signOutGoogle() async {
    await GoogleSignIn().signOut();
  }

  //!signOut
  void signOut() async {
    await _auth.signOut();
  }

  //! signInWithGoogle
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


}
