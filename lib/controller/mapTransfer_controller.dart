import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/statics/constants.dart';

class MapTransformController extends TransformationController {
  MapTransformController() {
    // initialize map view on first load to default
    setView(getCenteredViewMatrix(0, 0));
  }

  MapTransformController.init(double x, double y) {
    // initialize map view on first load
    setView(getCenteredViewMatrix(x, y));
  }

  setView(Matrix4 m) => this.value = m;
  getViewX() => -this.value.row0.w;
  getViewY() => -this.value.row1.w;

  /// Returns transformation matrix to move view to the center with x,y coordinates
  /// x and y parameters are positive values from the top left corner
  Matrix4 getCenteredViewMatrix(double x, double y) {
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

    return Matrix4.translationValues(-dx, -dy, 0);
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
