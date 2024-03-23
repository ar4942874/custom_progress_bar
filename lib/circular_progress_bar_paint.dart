import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressBarPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;
  final double startAngle;
  final double endAngle;

  const CircularProgressBarPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
    required this.startAngle,
    required this.endAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Background Paint
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Progress Bar Paint
    Paint progressBarPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    double centerWidth = size.width / 2;
    double centerHeight = size.height / 2;

    Offset centerOffset = Offset(centerWidth, centerHeight);
    double radius = min(centerWidth, centerHeight) - (strokeWidth / 2);

    // Drawing Arc for Circle Background
    canvas.drawArc(
      Rect.fromCircle(center: centerOffset, radius: radius),
      startAngle,
      endAngle - startAngle,
      false,
      backgroundPaint,
    );

    // Drawing Arc for progress bar
    double sweepAngle = progress * (endAngle - startAngle);
    canvas.drawArc(
      Rect.fromCircle(center: centerOffset, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressBarPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
