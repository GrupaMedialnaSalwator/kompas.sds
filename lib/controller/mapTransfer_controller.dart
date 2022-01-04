import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/statics/constants.dart';

class MapTransformController extends TransformationController {
  static const double init_x = 0;
  static const double init_y = 0;

  MapTransformController() {
    // initialize map view on first load
    this.value =
        Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, init_x, init_y, 0, 1);
  }
  MapTransformController.init(double x, double y) {
    // initialize map view on first load
    setViewCenter(x, y);
  }

  /// x and y parameters are counted as positive values from the top left corner
  void setView(double x, double y) {
    this.value = Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, -x, -y, 0, 1);
  }

  /// x and y parameters are counter as positive values from the top left corner
  void setViewCenter(double x, double y) {
    double dx, dy;
    double screenWidth = Get.width;
    double screenHeight =
        Get.height - 40; // TODO: make 40 a constant for bottom bar
    print('x=' + x.toString() + ' y=' + y.toString());
    if (x < (Constants.maxMapSizeX - (screenWidth / 2))) {
      if (x < (screenWidth / 2)) {
        dx = 0;
      } else {
        dx = x - (screenWidth / 2);
      }
    } else {
      dx = Constants.maxMapSizeX - (screenWidth);
    }

    if (y < (Constants.maxMapSizeY - (screenHeight / 2))) {
      if (y < (screenHeight / 2)) {
        dy = 0;
      } else {
        dy = y - (screenHeight / 2);
      }
    } else {
      dy = Constants.maxMapSizeY - (screenHeight);
    }

    print('dx=' + dx.toString() + ' dy=' + dy.toString());
    this.value = Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, -dx, -dy, 0, 1);
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
