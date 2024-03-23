import 'package:custom_progress_indicators/circular_progress_bar_widget.dart';
import 'package:flutter/material.dart';

class FinalTest extends StatefulWidget {
  const FinalTest({super.key});

  @override
  State<FinalTest> createState() => _FinalTestState();
}

class _FinalTestState extends State<FinalTest> {
  // Variable to change animation e.g forward,reverse, stop or repeat
  Animate animate = Animate.forward;
  @override
  Widget build(BuildContext context) {
    return CircularProgressBar(
      size: const Size(200, 200),
      duration: const Duration(seconds: 2),
      percentageFontSize: 30,
      animationType: animate,
      onTap: (animationType) {
        if (animationType == Animate.forward) {
          setState(() {
            animate = Animate.stop;
          });
        } else if (animationType == Animate.stop) {
          setState(() {
            animate = Animate.forward;
          });
        }
      },
    );
  }
}
