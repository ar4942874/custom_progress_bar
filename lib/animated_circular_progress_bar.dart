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
    this.progress,
    this.onTap,
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
  final double? progress;
  final AnimationController animationController;

  Animation<double> get animation => listenable as Animation<double>;
  //making getter of percentage
  int get getPercentage => (progress! * animation.value).toInt();
  //generating progress getter
  double get getProgress => progress! * animation.value / 100;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: GestureDetector(
          onTap: onTap,
          child: CustomPaint(
            painter: CircularProgressBarPainter(
              progress: getProgress,
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
        ),
      ),
    );
  }
}
