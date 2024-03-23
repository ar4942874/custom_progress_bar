import 'dart:math';
import 'package:custom_progress_indicators/animated_circular_progress_bar.dart';
import 'package:flutter/material.dart';

//Making TypeDef to get AnimationType from user
typedef AnimationCallback = void Function(Animate animationType);

class CircularProgressBar extends StatefulWidget {
  const CircularProgressBar(
      {Key? key,
      required this.size,
      required this.duration,
      this.backgroundColor = Colors.grey,
      this.progressColor = Colors.blue,
      this.strokeWidth = 10,
      this.startAngle = -0.5 * pi,
      this.endAngle = 1.5 * pi,
      this.percentageFontSize = 30,
      this.percentageFontColor = Colors.black,
      this.progressValue = 100,
      required this.onTap,
      required this.animationType})
      : super(key: key);

  final Size size;
  final Duration duration;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;
  final double startAngle;
  final double endAngle;
  final double percentageFontSize;
  final Color percentageFontColor;
  final double? progressValue;
  final Animate animationType;
  final AnimationCallback onTap;

  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  void handleTap() {
    widget.onTap(widget.animationType);
    switch (widget.animationType) {
      case Animate.forward:
        _animationController.forward();
        break;
      case Animate.reverse:
        _animationController.reverse();
        break;
      case Animate.stop:
        _animationController.stop();
        break;
      case Animate.repeat:
        _animationController.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: AnimatedCircularProgressBar(
        backgroundColor: widget.backgroundColor,
        animationController: _animationController,
        size: widget.size,
        duration: widget.duration,
        progressColor: widget.progressColor,
        strokeWidth: widget.strokeWidth,
        startAngle: widget.startAngle,
        endAngle: widget.endAngle,
        percentageFontSize: widget.percentageFontSize,
        progress: widget.progressValue,
        percentageFontColor: widget.percentageFontColor,
      ),
    );
  }
}

enum Animate { forward, reverse, stop, repeat }
