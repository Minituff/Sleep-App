import 'dart:math';

import 'package:animator/animator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Charts extends StatefulWidget {
  Charts({Key key}) : super(key: key);

  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  List<FlSpot> data = [];
  List<int> upOrDown = [];
  final _random = new Random();

  // Generates a positive random integer from [min], inclusive, to [max], exclusive.
  int next(int min, int max) => min + _random.nextInt(max - min);

  @override
  void initState() {
    super.initState();
    int pointCount = next(3, 10); // A radnom number of points from 3-9
    for (double i = 1; i <= pointCount; i++) {
      data.add(FlSpot(i, Random().nextDouble() * 8));
      upOrDown.add(Random().nextInt(2));
    }
  }

  List<Color> colors = [Colors.white.withOpacity(0.2)];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Animator(
          curve: Curves.ease,
          repeats: 0,
          tween: Tween<double>(begin: 0, end: 10),
          duration: const Duration(seconds: 7),
          builder: (anim) {
            if (anim.value.round() == 10.0) {
              int length = upOrDown.length;
              upOrDown.clear();
              for (double i = 1; i <= length; i++) {
                upOrDown.add(Random().nextInt(2));
              }
            }
            int index = -1;
            data = data.map((spot) {
              index++;
              if (upOrDown.elementAt(index) == 1) {
                return FlSpot(spot.x, spot.y + 0.025);
              } else {
                return FlSpot(spot.x, spot.y - 0.025);
              }
            }).toList();

            return IgnorePointer(
              child: FlChart(
                chart: LineChart(
                  LineChartData(
                    lineTouchData: const LineTouchData(enabled: false),
                    lineBarsData: [
                      LineChartBarData(
                        colors: colors,
                        spots: data,
                        curveSmoothness: 0.50,
                        isCurved: true,
                        barWidth: 0,
                        belowBarData: BelowBarData(show: true, colors: colors),
                        dotData: const FlDotData(show: false),
                      ),
                    ],
                    minY: 0,
                    titlesData: const FlTitlesData(
                      leftTitles: const SideTitles(
                        showTitles: false,
                      ),
                      bottomTitles: const SideTitles(
                        showTitles: false,
                      ),
                    ),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(
                      show: false,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
