import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/statics/constants.dart';

class SheetView extends StatelessWidget {
  const SheetView({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final TripDataController _tripDataController = Get.find();

    return Scaffold(
      body: Container(
        height: Get.height * (1 - Constants.tripBottomSheetRatio),
        width: Get.width,
        child: Hero(
          tag: selectedIndex.toString(),
          child: Image.asset(
            _tripDataController.getTripItem(index: selectedIndex).imageAsset,
            fit: BoxFit.fill,
            gaplessPlayback: true, // prevents flicker on switching images
          ),
        ),
      ),
    );
  }
}
