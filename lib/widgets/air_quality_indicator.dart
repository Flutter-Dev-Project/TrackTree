import 'package:flutter/material.dart';

class AirQualityIndicator extends StatelessWidget {
  const AirQualityIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.air, color: Colors.green, size: 30),
        const SizedBox(width: 8),
        const Text(
          "Air",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 70),
        const Spacer(),
        const Text(
          "40 PPM",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}