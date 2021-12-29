import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/trip_db_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/statics.dart';

class SelectTripPage extends StatelessWidget {
  const SelectTripPage({
    Key? key,
    required this.tripIndex,
  }) : super(key: key);

  final int tripIndex;

  @override
  Widget build(BuildContext context) {
    final TripDBController _tripController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Container(
        height: Get.height * (1 - Statics.tripBottomSheetRatio),
        width: Get.width,
        child: Hero(
          tag: tripIndex.toString(),
          child: Image.asset(
            _tripController.getTripItem(index: tripIndex).imageAsset,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
