import 'dart:math';

import 'package:custom_progress_indicators/circular_progress_bar_paint.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressBar extends StatefulWidget {
  const CustomCircularProgressBar(
      {Key? key,
      required this.duration,
      required this.size,
      this.backgroundColor = Colors.grey,
      this.progressColor = Colors.blue,
      this.strokeWidth = 10,
      this.startAngle = -0.5 * pi,
      this.endAngle = 1.5 * pi,
      this.percentageFontSize = 30,
      this.percentageFontColor = Colors.black})
      : super(key: key);

  final Duration duration;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;
  final double startAngle;
  final double endAngle;
  final double percentageFontSize;
  final Color percentageFontColor;
  final Size size;

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

  void runAnimation() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        runAnimation();
      },
      child: CustomPaint(
        size: widget.size,
        painter: CircularProgressBarPainter(
            progress: _progressAnimation.value,
            backgroundColor: widget.backgroundColor,
            progressColor: widget.progressColor,
            strokeWidth: widget.strokeWidth,
            startAngle: widget.startAngle,
            endAngle: widget.endAngle,
            size: widget.size),
        child: Center(
          child: Text(
            '${(_progressAnimation.value * 100).toInt()}%',
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
