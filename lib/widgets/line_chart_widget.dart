import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(1, 1),
                FlSpot(2, 2),
                FlSpot(3, 1.5),
                FlSpot(4, 2.5),
                FlSpot(5, 3),
              ],
              isCurved: true,
              gradient: LinearGradient(
                colors: [Colors.green, Colors.lightGreen],
              ),
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(show: true, color: Colors.green.withOpacity(0.3)),
            ),
          ],
          titlesData: FlTitlesData(
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
          ),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              // Customize tooltip appearance as needed
            ),
            touchCallback: (FlTouchEvent event, lineTouchResponse) {
              // Add pointer animations here if needed
            },
            handleBuiltInTouches: true,
          ),
        ),
      ),
    );
  }
}
