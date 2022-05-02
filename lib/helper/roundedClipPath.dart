import 'package:flutter/material.dart';
import 'package:kompas/statics/constants.dart';

class RoundedClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    // 1. Point = (0,0)
    // 2. Point
    path.lineTo(0, h);
    // 3. Point
    path.arcToPoint(
      Offset(Constants.borderRadius, h - Constants.borderRadius),
      radius: Radius.circular(Constants.borderRadius),
    );
    // 4. Point
    path.lineTo(w - Constants.borderRadius, h - Constants.borderRadius);
    // 5. Point
    path.arcToPoint(
      Offset(w, h),
      radius: Radius.circular(Constants.borderRadius),
    );
    // 6. Point
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
