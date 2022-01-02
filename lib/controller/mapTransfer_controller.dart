import 'package:flutter/material.dart';

class MapTransformController extends TransformationController {
  MapTransformController(double x, double y) {
    // initialize map view on first load
    this.value = Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, x, y, 0, 1);
  }
  void setView(double x, double y) {
    this.value = Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, x, y, 0, 1);
  }
}

/// Notes:
///
// Matrix4(
//   scaleX, 0, 0, 0, //
//   0, scaleY, 0, 0, //
//   0, 0, 1, 0, //
//   translateX, translateY, 0, 1,
// )