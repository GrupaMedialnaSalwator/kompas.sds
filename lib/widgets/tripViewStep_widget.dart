import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';
import 'package:gra_terenowa/widgets/tripViewStepButtons_widget.dart';
import 'package:gra_terenowa/widgets/tripViewStepSwitch_widget.dart';

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
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.asset(
              tripDataController
                  .getStepItem(tripDataSelect: tripDataSelect)
                  .imageAsset,
              fit: BoxFit.fill,
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
