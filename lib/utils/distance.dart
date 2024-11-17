import 'dart:math';

double distanceBetween(
  double longitude1,
  double latitude1,
  double longitude2,
  double latitude2,
) {
  toRadians(double degree) => degree * pi / 180;

  const double r = 6378137.0; // 地球の半径

  final double f1 = toRadians(latitude1);
  final double f2 = toRadians(latitude2);
  final double l1 = toRadians(longitude1);
  final double l2 = toRadians(longitude2);
  final num a = pow(sin((f2 - f1) / 2), 2);
  final double b = cos(f1) * cos(f2) * pow(sin((l2 - l1) / 2), 2);
  final double d = 2 * r * asin(sqrt(a + b));
  return d;
}

bool isInArea(
  double longitude1,
  double latitude1,
  double longitude2,
  double latitude2,
  double radius,
) {
  return distanceBetween(longitude1, latitude1, longitude2, latitude2) <=
      radius;
}
