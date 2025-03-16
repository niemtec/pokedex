import 'package:flutter/material.dart';
import 'package:pokedex/presentation/utils/extensions.dart';

class DotIndicator extends Decoration {
  final Color color;

  const DotIndicator({required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(color);
  }
}

class _DotPainter extends BoxPainter {
  final Color color;

  _DotPainter(this.color);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double xPos = offset.dx + configuration.size!.width / 2;
    final double yPos = offset.dy + configuration.size!.height - 3;
    final Offset circleOffset = Offset(xPos, yPos);

    // Draw the glow effect using multiple circles
    for (double radius = 8; radius >= 4; radius -= 2) {
      final Paint glowPaint = Paint()
        ..color = brightenColour(color, 0.2)
            .withValues(alpha: (radius - 4) / 9) // Fade effect
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, radius);

      canvas.drawCircle(circleOffset, radius, glowPaint);
    }

    // Draw the main dot
    canvas.drawCircle(circleOffset, 3, paint);
  }
}
