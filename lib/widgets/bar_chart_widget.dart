import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:track_tree/models/aqi_data.dart';

class BarChartWidget extends StatelessWidget {
  final List<AQIData> data;

  const BarChartWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: data.asMap().entries.map((entry) {
            int index = entry.key;
            AQIData aqiData = entry.value;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(toY: aqiData.aqi, color: Colors.lightGreen)
              ],
            );
          }).toList(),
          titlesData: FlTitlesData(
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
            handleBuiltInTouches: true,
          ),
        ),
      ),
    );
  }
}
