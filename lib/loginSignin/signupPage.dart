import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/loginSignin/loginPage.dart';
import 'package:my_bu/properties/prop.dart';
import 'package:my_bu/screens/homeScreen/homeScreen.dart';
import 'package:my_bu/screens/landingPage/landingHomePage.dart';

class signupPage extends StatefulWidget {
  signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  // variable

  // text controllers
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // size variable
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    // register
    void register() async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => homeScreen(),
            ),
            (e) => false,
          );
        }
      }
    }

    // signout
    // void signUserOut() async {
    //   FirebaseAuth.instance.signOut();
    // }

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: rangPrimary,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Align(
              alignment: Alignment(0, -0.2),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    // Text(
                    //   "if new",
                    //   style: GoogleFonts.montserrat(
                    //     fontSize: screenWidth / 18,
                    //     // fontWeight: FontWeight.bold,
                    //     color: rang6Light2,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        "Register Here!",
                        style: GoogleFonts.montserrat(
                          fontSize: screenWidth / 12,
                          fontWeight: FontWeight.bold,
                          color: rangBackground,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              color: rangBackground,
                            ),
                          ),
                          fillColor: rangBackground,
                          focusColor: rangBackground,
                          labelText: "email",
                          helperText: '',
                          filled: true,
                        ),
                        style: GoogleFonts.montserrat(
                          // fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 20,
                          color: rangAccent,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 5,
                        bottom: 0,
                      ),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              color: rangAccent,
                            ),
                          ),
                          fillColor: rangBackground,
                          focusColor: rangPrimary,
                          labelText: "Password",
                          helperText: '',
                          filled: true,
                        ),
                        style: GoogleFonts.montserrat(
                          // fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 20,
                          color: rangSecondary,
                        ),
                      ),
                    ),
                    Container(
                      height: screenWidth / 7,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                          color: rang6, borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        onPressed: () {
                          register();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "signup",
                          style: GoogleFonts.montserrat(
                            // fontWeight: FontWeight.bold,
                            fontSize: screenWidth / 15,
                            color: rangBackground,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45, right: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Text(
                              "have an account?",
                              style: GoogleFonts.montserrat(
                                // fontWeight: FontWeight.bold,
                                fontSize: screenheight / 40,
                                color: rangBackground,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => loginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "login",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenheight / 35,
                                  color: rangBackground,
                                ),
                              ),
                            ),
                            Text(
                              "here",
                              style: GoogleFonts.montserrat(
                                // fontWeight: FontWeight.bold,
                                fontSize: screenheight / 40,
                                color: rangBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
