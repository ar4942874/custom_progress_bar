import 'dart:math';

import 'package:custom_progress_indicators/animated_circular_progress_bar.dart';
import 'package:flutter/material.dart';


class CircularProgressBar extends StatefulWidget {
  const CircularProgressBar(
      {super.key,
      required this.size,
      required this.duration,
      this.backgroundColor = Colors.grey,
      this.progressColor = Colors.blue,
      this.strokeWidth = 10,
      this.startAngle = -0.5 * pi,
      this.endAngle = 1.5 * pi,
      this.percentageFontSize = 30,
      this.percentageFontColor = Colors.black,
      this.onTap
      });

  final Size size;
  final Duration duration;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;
  final double startAngle;
  final double endAngle;
  final double percentageFontSize;
  final Color percentageFontColor;
  final VoidCallback? onTap;

  @override
  State<CircularProgressBar> createState() => _CircularProogressBarState();
}

class _CircularProogressBarState extends State<CircularProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _progressAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {})
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.reset();
            }
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedCircularProgressBar(
        backgroundColor: widget.backgroundColor,
        animationController: _animationController,
        size: widget.size,
        duration: widget.duration,
        progressColor: widget.progressColor,
        strokeWidth: widget.strokeWidth,
        startAngle: widget.startAngle,
        endAngle: widget.endAngle,
        percentageFontSize: widget.percentageFontSize,
        onTap: widget.onTap,
        percentageFontColor: widget.percentageFontColor);
  }
}
