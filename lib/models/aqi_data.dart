import 'dart:convert';
import 'package:http/http.dart' as http;

class AQIData {
  final String date;
  final double aqi;

  AQIData({required this.date, required this.aqi});

  factory AQIData.fromJson(Map<String, dynamic> json) {
    return AQIData(
      date: json['dateTime'],
      aqi: (json['indexes'][0]['aqi'] as num).toDouble(), // Cast the AQI to double
    );
  }
}

Future<List<AQIData>> fetchAQIData() async {
  final response = await http.post(
    Uri.parse('https://airquality.googleapis.com/v1/currentConditions:lookup?key='),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'location': {
        'latitude': 37.419734,
        'longitude': -122.0827784
      }
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> json = jsonDecode(response.body); // Decode the response as a Map
    return [AQIData.fromJson(json)];
  } else {
    throw Exception('Failed to load AQI data');
  }
}