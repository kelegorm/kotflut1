import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'MainApp.dart';


final googleSignIn = new GoogleSignIn();

final fAuth = FirebaseAuth.instance;


Future<Null> _ensureLoggedIn() async {
  if (googleSignIn.currentUser == null)
    await googleSignIn.signInSilently();
  if (googleSignIn.currentUser == null)
    await googleSignIn.signIn();

  if (await fAuth.currentUser() == null) {
    var creds = await googleSignIn.currentUser.authentication;
    await fAuth.signInWithGoogle(idToken: creds.idToken, accessToken: creds.accessToken);
  }
}

void main() {
  runApp(new MainApp());
  _ensureLoggedIn();
}
