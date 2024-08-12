import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:track_tree/models/aqi_data.dart';

class LineChartWidget extends StatelessWidget {
  final List<AQIData> data;

  const LineChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: data
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value.aqi))
                  .toList(),
              isCurved: true,
              gradient: LinearGradient(
                colors: [Colors.green, Colors.lightGreen],
              ),
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                  show: true, color: Colors.green.withOpacity(0.3)),
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
                  return Text(data[value.toInt()].date,
                      style: TextStyle(color: Colors.black, fontSize: 12));
                },
              ),
            ),
          ),
          lineTouchData: LineTouchData(
            handleBuiltInTouches: true,
          ),
        ),
      ),
    );
  }
}
