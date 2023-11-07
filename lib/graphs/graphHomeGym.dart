import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/properties/prop.dart';

class gymStrengthGraph extends StatefulWidget {
  const gymStrengthGraph({super.key});

  @override
  State<gymStrengthGraph> createState() => _gymStrengthGraphState();
}

class _gymStrengthGraphState extends State<gymStrengthGraph> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 1.2,
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
    double width = 30,
    List<int> showTooltips = const [],
  }) {
    barColor ??= rangPrimary;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: barColor,
          width: width,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: rangAccent),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: rangSecondary,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(2, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 55, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 35, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData({double? maxy}) {
    return BarChartData(
      maxY: 100,
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
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(
          '  Gym\nK-block',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: rang6,
          ),
        );
        break;
      case 1:
        text = Text(
          '   Gym\nD-Block',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: rang6,
          ),
        );
        break;
      default:
        text = const Text('');
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: text,
    );
  }
}
