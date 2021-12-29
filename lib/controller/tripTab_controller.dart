import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/app_controller.dart';

class TripTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TripTabController({
    required this.tripIndex,
    required this.initLength,
  });

  final int initLength;
  final int tripIndex;

  late TabController controller;

  int getIndex() {
    return controller.index;
  }

  void resetIndex() {
    controller.index = 0;
  }

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: initLength);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
