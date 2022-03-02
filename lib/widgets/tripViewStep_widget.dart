import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/controller/tripState_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/widgets/tripViewStepButtons_widget.dart';
import 'package:kompas/widgets/tripViewStepSwitch_widget.dart';

class TripViewStep extends StatelessWidget {
  const TripViewStep({
    Key? key,
    required this.tripDataController,
    required this.tripStateController,
    required this.tripDataSelect,
  }) : super(key: key);

  final TripDataController tripDataController;
  final TripStateController tripStateController;
  final TripDataSelect tripDataSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding to avoid status bar works only on physical devices
        SizedBox(
          height: MediaQueryData.fromWindow(window).padding.top,
        ),
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.asset(
              tripDataController
                  .getStepItem(tripDataSelect: tripDataSelect)
                  .imageAsset,
              fit: BoxFit.fill,
              gaplessPlayback: true, // prevents flicker on switching images
            ),
            // Draw a decoration with rounded corners at the bottom of image
            Positioned(
              bottom: 0,
              child: Container(
                  width: Get.width,
                  height: Constants.borderRadius,
                  decoration: BoxDecoration(
                      color: AppColors.primaryWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Constants.borderRadius),
                        topRight: Radius.circular(Constants.borderRadius),
                      )),
                  child: SizedBox.shrink()),
            ),
          ],
        ),

        TripViewStepSwitch(
          tripStateController: tripStateController,
          tripDataController: tripDataController,
          tripDataSelect: tripDataSelect,
        ),

        // Button menu
        Container(
          margin: EdgeInsets.all(Constants.insideMargin),
          child: TripViewStepButtons(
            tripStateController: tripStateController,
            tripDataController: tripDataController,
            tripDataSelect: tripDataSelect,
          ),
        )
      ],
    );
  }
}
