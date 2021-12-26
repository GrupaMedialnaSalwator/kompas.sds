import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/trip_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';

class SelectTripPage extends StatelessWidget {
  const SelectTripPage({
    Key? key,
    required this.tripIndex,
  }) : super(key: key);

  final int tripIndex;

  @override
  Widget build(BuildContext context) {
    final TripController _tripController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Stack(
        //fit: StackFit.expand,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: Get.height * 0.4,
            width: Get.width,
            child: Hero(
              tag: tripIndex.toString(),
              child: Material(
                child: Image.asset(
                  _tripController.getTripItem(index: tripIndex).imageAsset,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}