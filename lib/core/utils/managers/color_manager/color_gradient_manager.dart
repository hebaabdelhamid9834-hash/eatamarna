import 'package:flutter/material.dart';

class ColorGradientManager {
  static const LinearGradient yellowGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0xffFF9900), Color(0xffFFED82)],
  );
}

class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;

  GradientBorderPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final rrect = RRect.fromRectAndRadius(
      rect.deflate(strokeWidth / 2),
      Radius.circular(radius),
    );

    final paint =
        Paint()
          ..shader = gradient.createShader(rect)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
