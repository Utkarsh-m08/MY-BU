import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/properties/prop.dart';
import 'package:my_bu/screens/homeScreen/gymAvailability.dart';
import 'package:my_bu/screens/homeScreen/libraryAvailibility.dart';
import 'package:my_bu/screens/homeScreen/messAvailability.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: rangBackground,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: rangPrimary,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: screenWidth * 0.95,
              height: screenheight * 0.2,
              decoration: BoxDecoration(
                color: rangBackground,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: screenWidth * 0.3,
                      width: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        color: rangPrimary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Icon(
                        Icons.qr_code,
                        size: screenWidth * 0.2,
                        color: rangBackground,
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Utkarsh Mishra",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.07,
                            color: rang6,
                          ),
                        ),
                        Text(
                          "\nE22CSEU0603\nut@gmail.com",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.055,
                            color: rang6,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: screenheight * 0.6,
              width: screenWidth * 0.95,
              decoration: BoxDecoration(
                color: rangBackground,
                boxShadow: [
                  // BoxShadow(
                  //   color: rangBackgroundShadow,
                  //   blurRadius: 10000,
                  //   spreadRadius: 6,
                  //   // blurStyle: BlurStyle.solid,
                  // ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: screenheight * 0.3,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: rangSecondary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: rangSecondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            DialogRoute(
                              context: context,
                              builder: (context) => messAvailability(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.food_bank,
                                  size: screenWidth * 0.2,
                                  color: rang6,
                                ),
                                Text(
                                  'Mess',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.15,
                                    color: rang6,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "click here to check availability",
                              style: GoogleFonts.montserrat(
                                // fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.05,
                                color: rang6,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: screenheight * 0.3,
                      // width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: rangNeutral,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: rangNeutral,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            DialogRoute(
                              context: context,
                              builder: (context) => gymAvailability(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.fitness_center_outlined,
                                  size: screenWidth * 0.2,
                                  color: rang6,
                                ),
                                Text(
                                  'GYM',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.15,
                                    color: rang6,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "click here to check availability",
                              style: GoogleFonts.montserrat(
                                // fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.05,
                                color: rang6,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: screenheight * 0.3,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: rangAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: rangAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            DialogRoute(
                              context: context,
                              builder: (context) => libraryAvailability(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.collections_bookmark_rounded,
                                  size: screenWidth * 0.2,
                                  color: rang6,
                                ),
                                Text(
                                  'Library',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.15,
                                    color: rang6,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "click here to check availability",
                              style: GoogleFonts.montserrat(
                                // fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.05,
                                color: rang6,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
