import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_bu/screens/homeScreen/homeScreen.dart';
import 'package:my_bu/screens/homeScreen/navigationBar.dart';
import 'package:my_bu/screens/landingPage/landingHomePage.dart';

class auth extends StatelessWidget {
  const auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // check if user logged in
          if (snapshot.hasData) {
            return navigationBar();
            // Navigator.pop(context);
          }

          // user is not logged in
          else {
            return landingHomePage();
          }
        },
      ),
    );
  }
}
