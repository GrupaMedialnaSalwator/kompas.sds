import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';
import 'package:gra_terenowa/statics/routes.dart';

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

  bool noLeftNavButton() {
    return (tripDataController.getPreviousStepIndex(
            tripDataSelect: tripDataSelect) ==
        -1);
  }

  bool noRightNavButton() {
    return (tripDataController.getNextStepIndex(
            tripDataSelect: tripDataSelect) ==
        -1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (noLeftNavButton())
          Container()
        else
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryNormal,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(Constants.borderRadius),
                right: Radius.circular(Constants.borderRadius),
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.symmetric(horizontal: Constants.buttonMargin),
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
        if (noLeftNavButton() && noRightNavButton())
          // End home button
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryNormal,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(Constants.borderRadius),
                right: Radius.circular(Constants.borderRadius),
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.symmetric(horizontal: Constants.buttonMargin),
              onPressed: () {
                tripStateController.resetState();
                Get.until((route) => Get.currentRoute == AppRoutes.home);
              },
              icon: const Icon(
                CupertinoIcons.house_alt,
                color: AppColors.primaryWhite,
              ),
            ),
          ),
        if (noRightNavButton())
          Container()
        else
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryNormal,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(Constants.borderRadius),
                right: Radius.circular(Constants.borderRadius),
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.symmetric(horizontal: Constants.buttonMargin),
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
