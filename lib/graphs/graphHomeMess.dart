import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/properties/prop.dart';

class messStrengthGraph extends StatefulWidget {
  const messStrengthGraph({super.key});

  @override
  State<messStrengthGraph> createState() => _messStrengthGraphState();
}

class _messStrengthGraphState extends State<messStrengthGraph> {
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
        1,
        (i) {
          switch (i) {
            case 0:
              return makeGroupData(0, 654, isTouched: i == touchedIndex);
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
          'Strength',
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
