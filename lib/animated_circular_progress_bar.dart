import 'dart:math';

import 'package:custom_progress_indicators/circular_progress_bar_paint.dart';
import 'package:flutter/material.dart';

class AnimatedCircularProgressBar extends AnimatedWidget {
  const AnimatedCircularProgressBar({
    
    Key? key,
    required this.size,
    required this.progressColor,
    required this.strokeWidth,
    required this.startAngle,
    required this.endAngle,
    required this.percentageFontSize,
    required this.percentageFontColor,
    required this.animationController,
    required this.duration,
    required this.backgroundColor,
    this.onTap
  }) : super(key: key, listenable: animationController);

  final Size size;
  final Duration duration;
  final Color progressColor;
  final double strokeWidth;
  final double startAngle;
  final double endAngle;
  final double percentageFontSize;
  final Color percentageFontColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  final AnimationController animationController;

  Animation<double> get animation => listenable as Animation<double>;
  int get getPercentage => (animation.value * 100).toInt();

  void startAnimationOnTap() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: GestureDetector(
      onTap: onTap??startAnimationOnTap,
      child: CustomPaint(
        painter: CircularProgressBarPainter(
          progress: animation.value,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          strokeWidth: strokeWidth,
          startAngle: startAngle,
          endAngle: endAngle,
        ),
        child: Center(
          child: Text(
            '$getPercentage%',
            style: TextStyle(
              color: percentageFontColor,
              fontSize: percentageFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
        )
      ),
    );
  }
}
