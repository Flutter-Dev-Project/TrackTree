import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(x: 24, barRods: [
              BarChartRodData(toY: 100, color: Colors.lightGreen)
            ], showingTooltipIndicators: [0]),
            BarChartGroupData(x: 25, barRods: [
              BarChartRodData(toY: 400, color: Colors.green)
            ], showingTooltipIndicators: [0]),
            BarChartGroupData(x: 26, barRods: [
              BarChartRodData(toY: 50, color: Colors.lightGreen)
            ], showingTooltipIndicators: [0]),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) {
                  return Text(value.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 12));
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) {
                  return Text(value.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 12));
                },
              ),
            ),
          ),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              // Customize tooltip appearance as needed
            ),
            touchCallback: (FlTouchEvent event, barTouchResponse) {
              // Add pointer animations here if needed
            },
            handleBuiltInTouches: true,
          ),
        ),
      ),
    );
  }
}
