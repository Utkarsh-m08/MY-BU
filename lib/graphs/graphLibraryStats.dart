import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/properties/prop.dart';

class LibraryWeeklyAvg extends StatefulWidget {
  const LibraryWeeklyAvg({super.key});

  @override
  State<LibraryWeeklyAvg> createState() => _LibraryWeeklyAvgState();
}

class _LibraryWeeklyAvgState extends State<LibraryWeeklyAvg> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BarChart(
                      mainBarData(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 20,
    List<int> showTooltips = const [],
  }) {
    barColor ??= rangAccent;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          width: width,
          // borderRadius: BorderRadius.all(Radius.circular(12)),
          // borderSide: BorderSide(color: rangAccent),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: rangBackground,
          ),
        ),
      ],
      // showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(
        7,
        (i) {
          switch (i) {
            case 0:
              return makeGroupData(0, 45, isTouched: i == touchedIndex);
            case 1:
              return makeGroupData(1, 4, isTouched: i == touchedIndex);
            case 2:
              return makeGroupData(2, 23, isTouched: i == touchedIndex);
            case 3:
              return makeGroupData(3, 75, isTouched: i == touchedIndex);
            case 4:
              return makeGroupData(4, 15, isTouched: i == touchedIndex);
            case 5:
              return makeGroupData(5, 77, isTouched: i == touchedIndex);
            case 6:
              return makeGroupData(6, 99, isTouched: i == touchedIndex);
            default:
              return throw Error();
          }
        },
      );

  BarChartData mainBarData({double? maxy}) {
    return BarChartData(
      maxY: maxy,
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 50,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      // gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(
          'M',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: rang6,
          ),
        );
        break;
      case 1:
        text = Text(
          'T',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: rang6,
          ),
        );
        break;
      case 2:
        text = Text(
          'W',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: rang6,
          ),
        );
        break;
      case 3:
        text = Text(
          'T',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: rang6,
          ),
        );
        break;
      case 4:
        text = Text(
          'F',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: rang6,
          ),
        );
        break;
      case 5:
        text = Text(
          'S',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: rang6,
          ),
        );
        break;
      case 6:
        text = Text(
          'S',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: rang6,
          ),
        );
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}

// monthly avg

class libraryMonthlyAvg extends StatefulWidget {
  const libraryMonthlyAvg({super.key});

  @override
  State<libraryMonthlyAvg> createState() => _libraryMonthlyAvgState();
}

class _libraryMonthlyAvgState extends State<libraryMonthlyAvg> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BarChart(
                      mainBarData(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 15,
    List<int> showTooltips = const [],
  }) {
    barColor ??= rangAccent;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          width: width,
          // borderRadius: BorderRadius.all(Radius.circular(12)),
          // borderSide: BorderSide(color: rangAccent),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: rangBackground,
          ),
        ),
      ],
      // showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(
        12,
        (i) {
          switch (i) {
            case 0:
              return makeGroupData(0, 12, isTouched: i == touchedIndex);
            case 1:
              return makeGroupData(1, 133, isTouched: i == touchedIndex);
            case 2:
              return makeGroupData(2, 4, isTouched: i == touchedIndex);
            case 3:
              return makeGroupData(3, 67, isTouched: i == touchedIndex);
            case 4:
              return makeGroupData(4, 33, isTouched: i == touchedIndex);
            case 5:
              return makeGroupData(5, 77, isTouched: i == touchedIndex);
            case 6:
              return makeGroupData(6, 98, isTouched: i == touchedIndex);
            case 7:
              return makeGroupData(7, 45, isTouched: i == touchedIndex);
            case 8:
              return makeGroupData(8, 6, isTouched: i == touchedIndex);
            case 9:
              return makeGroupData(9, 99, isTouched: i == touchedIndex);
            case 10:
              return makeGroupData(10, 99, isTouched: i == touchedIndex);
            case 11:
              return makeGroupData(11, 77, isTouched: i == touchedIndex);
            default:
              return throw Error();
          }
        },
      );

  BarChartData mainBarData({double? maxy}) {
    return BarChartData(
      maxY: maxy,
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 50,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      // gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(
          'JAN',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 1:
        text = Text(
          'fEB',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 2:
        text = Text(
          'MAR',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 3:
        text = Text(
          'APR',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 4:
        text = Text(
          'MAY',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 5:
        text = Text(
          'JUN',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 6:
        text = Text(
          'JUL',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 7:
        text = Text(
          'AUG',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 8:
        text = Text(
          'SEP',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 9:
        text = Text(
          'OCT',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 10:
        text = Text(
          'NOV',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      case 11:
        text = Text(
          'DEC',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: rang6,
          ),
        );
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}

// FOOD STATS

class libraryWeeklyPop extends StatefulWidget {
  const libraryWeeklyPop({super.key});

  @override
  State<libraryWeeklyPop> createState() => _libraryWeeklyPopState();
}

class _libraryWeeklyPopState extends State<libraryWeeklyPop> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BarChart(
                      mainBarData(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 20,
    List<int> showTooltips = const [],
  }) {
    barColor ??= rangAccent;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          width: width,
          // borderRadius: BorderRadius.all(Radius.circular(12)),
          // borderSide: BorderSide(color: rangAccent),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 1000,
            color: rangBackground,
          ),
        ),
      ],
      // showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(
        3,
        (i) {
          switch (i) {
            case 0:
              return makeGroupData(0, 900, isTouched: i == touchedIndex);
            case 1:
              return makeGroupData(1, 600, isTouched: i == touchedIndex);
            case 2:
              return makeGroupData(2, 300, isTouched: i == touchedIndex);
            default:
              return throw Error();
          }
        },
      );

  BarChartData mainBarData({double? maxy}) {
    return BarChartData(
      maxY: maxy,
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 50,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      // gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(
          'Novels',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: rang6,
          ),
        );
        break;
      case 1:
        text = Text(
          '  Enterence',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: rang6,
          ),
        );
        break;
      case 2:
        text = Text(
          '  comics',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: rang6,
          ),
        );
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}

// nutrients

class nutrientsPieChart extends StatefulWidget {
  const nutrientsPieChart({super.key});

  @override
  State<nutrientsPieChart> createState() => _nutrientsPieChartState();
}

class _nutrientsPieChartState extends State<nutrientsPieChart> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        swapAnimationCurve: Curves.easeInOut,
        swapAnimationDuration: const Duration(microseconds: 750),
        PieChartData(
          // centerSpaceColor: rang6,
          centerSpaceRadius: screenWidth * 0.3, sectionsSpace: 10,
          borderData: FlBorderData(
            show: false,
          ),

          sections: [
            PieChartSectionData(
              title: "Protien",
              radius: screenWidth * 0.18,
              color: rangSecondary,
              value: 30,
              titleStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05,
                color: rang6,
              ),
            ),
            PieChartSectionData(
              title: "Fats",
              radius: screenWidth * 0.12,
              color: rangAccent,
              value: 12,
              titleStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05,
                color: rang6,
              ),
            ),
            PieChartSectionData(
              title: "Carbs",
              color: rangNeutral,
              radius: screenWidth * 0.1,
              value: 10,
              titleStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05,
                color: rang6,
              ),
            ),
            PieChartSectionData(
              title: "Vitamins",
              radius: screenWidth * 0.15,
              color: rangPrimary,
              value: 30,
              titleStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05,
                color: rangNeutral,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
