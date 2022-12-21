import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }
      _user = googleUser;
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
  // GoogleSignInAccount? _user;
  // GoogleSignInAccount get user => _user!;
  // Future googleLogin() async {
  //   final googleUser = await googleSignIn.signIn();
  //   if (googleUser == null) return;
  //   _user = googleUser;

  //   final googleAuth = await googleUser.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
