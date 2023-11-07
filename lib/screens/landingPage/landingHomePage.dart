import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/loginSignin/loginPage.dart';
import 'package:my_bu/loginSignin/signupPage.dart';
import 'package:my_bu/properties/prop.dart';
import 'package:my_bu/screens/homeScreen/homeScreen.dart';
import 'package:my_bu/screens/homeScreen/navigationBar.dart';

class landingHomePage extends StatefulWidget {
  const landingHomePage({super.key});

  @override
  State<landingHomePage> createState() => _landingHomePageState();
}

class _landingHomePageState extends State<landingHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: rangBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: screenheight * 0.3,
              width: screenWidth,
              decoration: BoxDecoration(
                  // color: rangAccent,
                  ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Row(children: [
                    Text(
                      "MY BU",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: screenheight * 0.10,
                        color: rang6,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Container(
              height: screenheight * 0.7,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(20),
                    // topRight: Radius.circular(20),
                    ),
                color: rangPrimary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // color: rangSecondary,
                      height: screenheight * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        color: rangBackground,
                        height: screenheight * 0.01,
                        width: screenWidth * 0.8,
                      ),
                    ),
                    Text(
                      "The BU Companion\n",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: screenheight * 0.03,
                        color: rangBackground,
                      ),
                    ),
                    Text(
                      "Elevate Campus Living\n",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: screenheight * 0.03,
                        color: rangBackground,
                      ),
                    ),
                    Text(
                      "Better than collPoll",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: screenheight * 0.03,
                        color: rangBackground,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        color: rangBackground,
                        height: screenheight * 0.01,
                        width: screenWidth * 0.8,
                      ),
                    ),
                    Container(
                      // color: rangSecondary,
                      height: screenheight * 0.15,
                    ),
                    SizedBox(height: screenheight * 0.1),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: screenheight * 0.08,
                            width: screenWidth * 0.4,
                            child: ElevatedButton(
                              child: Text(
                                "Log In",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.05,
                                  color: rangBackground,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(screenheight * 0.5),
                                ),
                                // elevation: 5,
                                backgroundColor: rangSecondary,
                                foregroundColor: rang6,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => loginPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: screenheight * 0.08,
                            width: screenWidth * 0.4,
                            child: ElevatedButton(
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.05,
                                  color: rangBackground,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(screenheight * 0.5),
                                ),
                                // elevation: 5,
                                backgroundColor: rangSecondary,
                                foregroundColor: rang6,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => signupPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: screenheight / 40,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
