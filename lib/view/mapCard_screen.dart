import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/mapData_controller.dart';
import 'package:kompas/helper/roundedClipPath.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';

class MapCardPage extends StatelessWidget {
  MapCardPage({
    Key? key,
    required this.mapItemIndex,
  }) : super(key: key);

  final int mapItemIndex;

  @override
  Widget build(BuildContext context) {
    final MapDataController _mapDataController = Get.find();

    return Scaffold(
      backgroundColor: AppColors.primaryNormal,
      body: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.primaryDark,
              AppColors.primaryLight,
            ],
          ),
        ),
        child: ClipPath(
          clipper: RoundedClipPath.down(), // create rounded corners at the bottom of an image
          child: Image.asset(
            _mapDataController.getMapItem(index: mapItemIndex).imageAsset,
            height: Get.height * (1 - Constants.tripBottomSheetRatio) + (Constants.borderRadius / 2),
            width: Get.width,
            fit: BoxFit.cover,
            gaplessPlayback: true, // prevents flicker on switching images
          ),
        ),
      ),
    );
  }
}
