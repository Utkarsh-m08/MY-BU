import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bu/properties/prop.dart';

class libraryStrengthGraph extends StatefulWidget {
  const libraryStrengthGraph({super.key});

  @override
  State<libraryStrengthGraph> createState() => _libraryStrengthGraphState();
}

class _libraryStrengthGraphState extends State<libraryStrengthGraph> {
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
    barColor ??= rangSecondary;
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
            color: rangPrimary,
          ),
        ),
      ],
      // showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(3, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 53, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 22, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 31, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

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
          'A Block\nLibrary',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: rang6,
          ),
        );
        break;
      case 1:
        text = Text(
          '  Law\nLibrary',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: rang6,
          ),
        );
        break;
      case 2:
        text = Text(
          'M block\n Library',
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
      space: 0,
      child: text,
    );
  }
}
