import 'package:custom_progress_indicators/custom_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomCircularProgressBar(
        size: Size(200, 200),
        duration: Duration(seconds: 3),
        progressColor: Colors.orange,
      ),
    );
  }
}
