import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/statics.dart';

/// Displays trip content based on step type
class TripViewStepButtons extends StatelessWidget {
  const TripViewStepButtons({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (tripDataController.getPreviousStepIndex(
                tripDataSelect: tripDataSelect) ==
            -1)
          Container()
        else
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryNormal,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(Statics.borderRadius),
                right: Radius.circular(Statics.borderRadius),
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.symmetric(horizontal: Statics.buttonMargin),
              onPressed: () => {
                tripStateController.gotoStepView(tripDataController
                    .getPreviousStepIndex(tripDataSelect: tripDataSelect))
              },
              icon: const Icon(
                CupertinoIcons.chevron_back,
                color: AppColors.primaryWhite,
              ),
            ),
          ),
        if (tripDataController.getNextStepIndex(
                tripDataSelect: tripDataSelect) ==
            -1)
          Container()
        else
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryNormal,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(Statics.borderRadius),
                right: Radius.circular(Statics.borderRadius),
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.symmetric(horizontal: Statics.buttonMargin),
              onPressed: () => {
                tripStateController.gotoStepView(tripDataController
                    .getNextStepIndex(tripDataSelect: tripDataSelect))
              },
              icon: const Icon(
                CupertinoIcons.chevron_forward,
                color: AppColors.primaryWhite,
              ),
            ),
          ),
      ],
    );
  }
}
