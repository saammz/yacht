import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class FirebaseAuthServices {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  Future<bool> showLogoutDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Proceed'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Future<void> signOut(BuildContext context) async {
    final bool shouldLogout = await showLogoutDialog(context);

    if (shouldLogout) {
      try {
        await Future.wait([
          auth.signOut(),
          googleSignIn.signOut(),
        ]);
      } on FirebaseAuthException catch (e) {
        print(e.toString());
        // You might want to show an error dialog or snackbar here
      }
    }
  }
}
