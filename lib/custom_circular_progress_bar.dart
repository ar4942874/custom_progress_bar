import 'dart:math';

import 'package:custom_progress_indicators/circular_progress_bar_paint.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressBar extends StatefulWidget {
  const CustomCircularProgressBar(
      {Key? key,
      required this.duration,
      required this.backgroundColor,
      required this.progressColor,
      required this.strokeWidth,
      required this.startAngle,
      required this.endAngle,
      required this.percentageFontSize,
      this.onTap,
      required this.percentageFontColor})
      : super(key: key);

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
  CustomCircularProgressBarState createState() =>
      CustomCircularProgressBarState();
}

class CustomCircularProgressBarState extends State<CustomCircularProgressBar>
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
          ..addListener(() {
            setState(() {});
          })
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

  void doubleTap() {
    _animationController.stop();
  }

  void onTap() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    int percentage = ((_progressAnimation.value * 100).toInt());

    return GestureDetector(
      onTap: widget.onTap ?? onTap,
      onDoubleTap: doubleTap,
      child: CustomPaint(
        painter: CircularProgressBarPainter(
          progress: _progressAnimation.value,
          backgroundColor: widget.backgroundColor,
          progressColor: widget.progressColor,
          strokeWidth: widget.strokeWidth,
          startAngle: widget.startAngle,
          endAngle: widget.endAngle,
        ),
        child: Center(
          child: Text(
            '$percentage%',
            style: TextStyle(
              color: widget.percentageFontColor,
              fontSize: widget.percentageFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
