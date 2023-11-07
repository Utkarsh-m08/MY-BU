import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/graphs/graphHomeGym.dart';
import 'package:my_bu/graphs/graphHomeMess.dart';
import 'package:my_bu/properties/prop.dart';

class gymAvailability extends StatefulWidget {
  const gymAvailability({super.key});

  @override
  State<gymAvailability> createState() => _gymAvailabilityState();
}

class _gymAvailabilityState extends State<gymAvailability> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Dialog(
      backgroundColor: rangAccent,
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
          color: rangNeutral,
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
                      "gym Crowd Strength ",
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
                    child: gymStrengthGraph(),
                  ),
                  Text(
                    "Current gym strengths\nare displayed here \nwhich are\n55% and 35%",
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
