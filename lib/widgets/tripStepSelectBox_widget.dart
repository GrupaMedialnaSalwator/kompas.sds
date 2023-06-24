import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/controller/tripState_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/text_styles.dart';

class TripStepSelectBox extends StatelessWidget {
  const TripStepSelectBox({
    Key? key,
    required this.boxView,
    required this.tripDataSelect,
    required this.selectionNum,
    required this.boxColor,
  }) : super(key: key);

  final bool boxView;
  final TripDataSelect tripDataSelect;
  final int selectionNum;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    final TripStateController _tripStateController = Get.find();
    final TripDataController _tripDataController = Get.find();
    if (boxView) {
      // show choices to select as boxes
      return InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constants.borderRadius),
            color: boxColor,
          ),
          child: Center(
            child: Text(
              _tripDataController.getStepItem(tripDataSelect: tripDataSelect).selection[selectionNum].text,
              style: AppTextStyles.headerH3.copyWith(color: AppColors.primaryDark),
            ),
          ),
        ),
        onTap: () {
          print("selected answer = " + selectionNum.toString());
          _tripStateController.setCurrentAnswer(selectionNum);
          _tripStateController.gotoStepView(
              _tripDataController.getStepItem(tripDataSelect: tripDataSelect).selection[selectionNum].stepLink);
          if (selectionNum == _tripDataController.getStepItem(tripDataSelect: tripDataSelect).correctSelection) {
            _tripStateController.incrementCurrentPoints();
          }
        },
      );
    } else {
      // show choices to select as rows
      return InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constants.borderRadius),
            border: Border.all(width: 16, color: boxColor),
            color: boxColor,
          ),
          child: Center(
            child: Text(
              _tripDataController.getStepItem(tripDataSelect: tripDataSelect).selection[selectionNum].text,
              style: AppTextStyles.headerH5.copyWith(color: AppColors.primaryDark),
            ),
          ),
        ),
        onTap: () {
          print("selected answer = " + selectionNum.toString());
          _tripStateController.setCurrentAnswer(selectionNum);
          _tripStateController.gotoStepView(
              _tripDataController.getStepItem(tripDataSelect: tripDataSelect).selection[selectionNum].stepLink);
          if (selectionNum == _tripDataController.getStepItem(tripDataSelect: tripDataSelect).correctSelection) {
            _tripStateController.incrementCurrentPoints();
          }
        },
      );
    }
  }
}
