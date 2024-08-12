import 'package:flutter/material.dart';
import 'package:track_tree/models/aqi_data.dart';
import 'package:track_tree/widgets/air_quality_indicator.dart';
import 'package:track_tree/widgets/bar_chart_widget.dart';
import 'package:track_tree/widgets/line_chart_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TrackTree"),
        backgroundColor: Colors.green,
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: FutureBuilder<List<AQIData>>(
        future: fetchAQIData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            final latestAQI = data.last.aqi;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Daily Summary",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 70),
                    BarChartWidget(data: data),
                    const SizedBox(height: 20),
                    AirQualityIndicator(aqi: latestAQI),
                    const SizedBox(height: 20),
                    LineChartWidget(data: data),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}