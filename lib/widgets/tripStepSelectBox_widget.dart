import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/constants.dart';

class TripStepSelectBox extends StatelessWidget {
  const TripStepSelectBox({
    Key? key,
    required this.tripDataSelect,
    required this.selectionNum,
    required this.boxColor,
  }) : super(key: key);

  final TripDataSelect tripDataSelect;
  final int selectionNum;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    final TripStateController _tripStateController = Get.find();
    final TripDataController _tripDataController = Get.find();
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.borderRadius),
          color: boxColor,
        ),
        child: Center(
          child: Text(
            _tripDataController
                .getStepItem(tripDataSelect: tripDataSelect)
                .selection[selectionNum]
                .text,
            style: Get.context!.textTheme.headline3
                ?.copyWith(color: AppColors.primaryDark),
          ),
        ),
      ),
      onTap: () {
        print("selected answer = " + selectionNum.toString());
        _tripStateController.setCurrentAnswer(selectionNum);
        _tripStateController.gotoStepView(_tripDataController
            .getStepItem(tripDataSelect: tripDataSelect)
            .selection[selectionNum]
            .stepLink);

        // TODO: fix flickering bug - resetIndex and incrementCurrentRun are not instantenous

        // 1. set current answer and set firstRender
        //_appController.setCurrentAnswer(selectionNum);
        //_tabController.setFirstRender();

        // 2. on first render draw all steps without the last one, which prevents flicker - automatically Obx()
        //_appController.incrementCurrentRun();

        // 3. reset tabIndex to zero - automatically by changine controller.index
        //_tabController.resetIndex();

        // 4. draw last step on final render
        //_tabController.resetFirstRender();
      },
    );
  }
}
