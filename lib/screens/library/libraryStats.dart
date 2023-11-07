import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/graphs/graphLibraryStats.dart';
import 'package:my_bu/graphs/graphMessStats.dart';
import 'package:my_bu/properties/prop.dart';

class libraryStats extends StatefulWidget {
  const libraryStats({super.key});

  @override
  State<libraryStats> createState() => _libraryStatsState();
}

class _libraryStatsState extends State<libraryStats> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: rangBackground,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LIBRARY ',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.17,
                    color: rangAccent,
                  ),
                ),
                Text(
                  'Statistics',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.19,
                    color: rangAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                    width: screenWidth * 0.8,
                    color: rangAccent,
                    height: screenheight * 0.02,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    width: screenWidth * 0.8,
                    color: rangAccent,
                    height: screenheight * 0.02,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 40),
                  child: Text(
                    'RUSH:',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.16,
                      color: rang6,
                    ),
                  ),
                ),
                Text(
                  'Weekly Average:',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.08,
                    color: rang6,
                  ),
                ),
                Text(
                  'At this time',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.06,
                    color: rang6,
                  ),
                ),
                LibraryWeeklyAvg(),
                Container(
                  height: screenheight * 0.04,
                ),
                Text(
                  'Monthly Average:',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.08,
                    color: rang6,
                  ),
                ),
                Text(
                  'At this time',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.06,
                    color: rang6,
                  ),
                ),
                libraryMonthlyAvg(),

                // Book Popularity
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 40),
                  child: Text(
                    'BOOKS:',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.16,
                      color: rang6,
                    ),
                  ),
                ),
                Text(
                  'Popular This Week:',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.08,
                    color: rang6,
                  ),
                ),
                libraryWeeklyPop(),
                Container(
                  height: screenheight * 0.01,
                ),
                Text(
                  'Data Colected from\nLibrary Books Being issued',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.04,
                    color: rang6,
                  ),
                ),
                Container(
                  height: screenheight * 0.06,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
