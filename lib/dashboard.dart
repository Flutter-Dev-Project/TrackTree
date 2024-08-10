import 'package:flutter/material.dart';
import 'package:track_tree/widgets/bar_chart_widget.dart';
import 'package:track_tree/widgets/air_quality_indicator.dart';
import 'package:track_tree/widgets/line_chart_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TrackTree"),
        backgroundColor: Colors.green, // Change this to your preferred color
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Daily Summary",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 70),
              const BarChartWidget(),
              const SizedBox(height: 20),
              const AirQualityIndicator(),
              const SizedBox(height: 20),
              const LineChartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
