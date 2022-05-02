import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/controller/tripState_controller.dart';
import 'package:kompas/helper/roundedClipPath.dart';
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
            ClipPath(
              clipper: RoundedClipPath(), // create rounded corners at the bottom of an image
              child: Image.asset(
                tripDataController.getStepItem(tripDataSelect: tripDataSelect).imageAsset,
                fit: BoxFit.fill,
                gaplessPlayback: true, // prevents flicker on switching images
              ),
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
