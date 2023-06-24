import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/statics/constants.dart';

class SelectTripPage extends StatelessWidget {
  const SelectTripPage({
    Key? key,
    required this.tripIndex,
  }) : super(key: key);

  final int tripIndex;

  @override
  Widget build(BuildContext context) {
    final TripDataController _tripDataController = Get.find();

    return Scaffold(
      body: Container(
        height: Get.height * (1 - Constants.tripBottomSheetRatio),
        width: Get.width,
        child: Hero(
          tag: tripIndex.toString(),
          child: Image.asset(
            _tripDataController.getTripItem(index: tripIndex).imageAsset,
            fit: BoxFit.cover,
            gaplessPlayback: true, // prevents flicker on switching images
          ),
        ),
      ),
    );
  }
}
