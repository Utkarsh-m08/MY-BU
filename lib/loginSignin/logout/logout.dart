import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/properties/prop.dart';

class logout extends StatefulWidget {
  const logout({super.key});

  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  // signout
  void signUserOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: rangAccent,
      child: ElevatedButton(
          onPressed: () {
            signUserOut();
          },
          child: Text("logut")),
    );
  }
}
