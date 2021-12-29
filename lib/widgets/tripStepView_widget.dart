import 'package:flutter/material.dart';
import 'package:gra_terenowa/controller/trip_db_controller.dart';
import 'package:gra_terenowa/extras/statics.dart';
import 'package:gra_terenowa/widgets/tripStepSwitch_widget.dart';

class TripStepView extends StatelessWidget {
  const TripStepView({
    Key? key,
    required this.tripController,
    required this.tripSelect,
  }) : super(key: key);

  final TripDBController tripController;
  final TripSelect tripSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          tripController.getStepItem(tripSelect: tripSelect).imageAsset,
          fit: BoxFit.fill,
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.all(Statics.insideMargin),
          child: TripStepSwitch(
            tripController: tripController,
            tripSelect: tripSelect,
          ),
        ),
      ],
    );
  }
}
