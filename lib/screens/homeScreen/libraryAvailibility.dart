import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/graphs/graphHomeLibrary.dart';
import 'package:my_bu/graphs/graphHomeMess.dart';
import 'package:my_bu/properties/prop.dart';

class libraryAvailability extends StatefulWidget {
  const libraryAvailability({super.key});

  @override
  State<libraryAvailability> createState() => _libraryAvailabilityState();
}

class _libraryAvailabilityState extends State<libraryAvailability> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Dialog(
      backgroundColor: rangSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      insetPadding: EdgeInsets.all(10),
      child: Container(
        height: screenheight * 0.8,
        width: screenWidth,
        decoration: BoxDecoration(
          color: rangAccent,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    // height: screenheight * 0.2,
                    // width: screenWidth * 0.3,
                    // color: rangAccent,
                    child: Text(
                      "Library Crowd Strength ",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.16,
                        color: rang6,
                      ),
                    ),
                  ),
                  Container(
                    // height: screenheight * 0.2,
                    // color: rangBackground,
                    child: libraryStrengthGraph(),
                  ),
                  Text(
                    "Current Library strengths\nare displayed here \nwhich are\n53%, 22% and 31%",
                    style: GoogleFonts.montserrat(
                      // fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                      color: rang6,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
