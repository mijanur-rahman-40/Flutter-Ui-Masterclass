import 'dart:math';

import 'package:flutter/rendering.dart';

class RadialPainter extends CustomPainter {
  final Color backgroundColor;
  final Color lineColor;
  final double percent;
  final double width;

  RadialPainter({
    this.backgroundColor,
    this.lineColor,
    this.percent,
    this.width,
  });
  @override
  void paint(Canvas canvas, Size size) {
    // accessing next to next element value
    Paint backgroundLine = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, backgroundLine);
    double sweepAngle = 2 * pi * percent;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        sweepAngle, false, completeLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
