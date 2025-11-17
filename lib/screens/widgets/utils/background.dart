import 'package:flutter/material.dart';

class SoftOrbsBackground extends StatelessWidget {
  const SoftOrbsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _OrbPainter(),
      size: Size.infinite,
    );
  }
}

class _OrbPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size s) {
    final base = Colors.redAccent; // Matches red theme
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 40)
      ..style = PaintingStyle.fill;

    final centers = [
      Offset(s.width * .18, s.height * .35),
      Offset(s.width * .55, s.height * .55),
      Offset(s.width * .85, s.height * .28),
    ];

    for (var i = 0; i < centers.length; i++) {
      paint.shader = RadialGradient(
        colors: [base.withOpacity(.15), Colors.transparent],
      ).createShader(
        Rect.fromCircle(
          center: centers[i],
          radius: 220 + i * 40,
        ),
      );
      canvas.drawCircle(centers[i], 220 + i * 40, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
