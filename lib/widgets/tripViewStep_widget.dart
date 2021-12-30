import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/statics.dart';
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
        Image.asset(
          tripDataController
              .getStepItem(tripDataSelect: tripDataSelect)
              .imageAsset,
          fit: BoxFit.fill,
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.all(Statics.insideMargin),
          child: TripViewStepSwitch(
            tripStateController: tripStateController,
            tripDataController: tripDataController,
            tripDataSelect: tripDataSelect,
          ),
        ),
        // This takes space between bottom menu
        Spacer(
          flex: 1,
        ),
        // Button menu
        Container(
          margin: EdgeInsets.all(Statics.insideMargin),
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
