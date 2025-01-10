import 'package:flutter/widgets.dart';

class StripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint yellowPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 220, 81)
      ..style = PaintingStyle.fill;
    final Paint blackPaint = Paint()
      ..color = const Color(0xFF000000)
      ..style = PaintingStyle.fill;

    const double stripeWidth = 10;
    final int stripeCount = (size.width / stripeWidth).toInt() + 1;

    for (int i = 0; i < stripeCount; i++) {
      Path path = Path();
      List<Offset> points = [];
      points.add(Offset(i * stripeWidth, 0));
      points.add(Offset((i + 1) * stripeWidth, 0));
      points.add(Offset((i + 1) * stripeWidth - 10, size.height));
      points.add(Offset(i * stripeWidth - 10, size.height));
      path.addPolygon(points, true);
      canvas.drawPath(path, i % 2 == 0 ? yellowPaint : blackPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
