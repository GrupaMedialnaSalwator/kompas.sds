import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/routes.dart';
import 'package:gra_terenowa/extras/statics.dart';
import 'package:gra_terenowa/model/database.dart';
import 'package:gra_terenowa/widgets/tripStepSelectBox_widget.dart';

/// Displays trip content based on step type
class TripViewStepSwitch extends StatelessWidget {
  const TripViewStepSwitch({
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
    switch (
        tripDataController.getStepItem(tripDataSelect: tripDataSelect).type) {
      case StepType.info:
        return Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                tripDataController
                    .getStepItem(tripDataSelect: tripDataSelect)
                    .title,
                style: Get.context!.textTheme.headline3
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                tripDataController
                    .getStepItem(tripDataSelect: tripDataSelect)
                    .description,
                style: Get.context!.textTheme.bodyText1
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ),
          ],
        );
      case StepType.select:
        int selectionLength = tripDataController
            .getStepItem(tripDataSelect: tripDataSelect)
            .selection
            .length;
        return GridView.count(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: selectionLength ~/ 2, // truncated division
          crossAxisSpacing: Statics.insideMargin,
          mainAxisSpacing: Statics.insideMargin,
          children: List<Widget>.generate(selectionLength, (int index) {
            return TripStepSelectBox(
              tripDataSelect: tripDataSelect,
              selectionNum: index,
              boxColor: AppColors.selectionColorList[index],
            );
          }),
        );
      case StepType.answer:
        return Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                tripDataController
                    .getStepItem(tripDataSelect: tripDataSelect)
                    .title,
                style: Get.context!.textTheme.headline3
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ),
            if (tripStateController.getCurrentAnswer() ==
                tripDataController
                    .getPrevStepItem(tripDataSelect: tripDataSelect)
                    .correctSelection)
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: Text(
                  tripDataController
                      .getStepItem(tripDataSelect: tripDataSelect)
                      .correctAnswer,
                  style: Get.context!.textTheme.bodyText1
                      ?.copyWith(color: AppColors.primaryDark),
                ),
              )
            else
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: Text(
                  tripDataController
                      .getStepItem(tripDataSelect: tripDataSelect)
                      .incorrectAnswer,
                  style: Get.context!.textTheme.bodyText1
                      ?.copyWith(color: AppColors.primaryDark),
                ),
              ),
          ],
        );
      case StepType.end:
        return Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                tripDataController
                    .getStepItem(tripDataSelect: tripDataSelect)
                    .title,
                style: Get.context!.textTheme.headline3
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                tripDataController
                    .getStepItem(tripDataSelect: tripDataSelect)
                    .description,
                style: Get.context!.textTheme.bodyText1
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(Statics.bottomMargin),
                child: TextButton(
                  child: Text(
                    "Koniec",
                    style: Get.context!.textTheme.headline3
                        ?.copyWith(color: AppColors.primaryWhite),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Statics.borderRadius),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primaryNormal,
                    ),
                  ),
                  onPressed: () {
                    tripStateController.resetState();
                    Get.until((route) => Get.currentRoute == AppRoutes.home);
                  },
                ),
              ),
            ),
          ],
        );
      default:
        assert(false, 'TripViewStepSwitch must have a valid switch type');
        return Container();
    }
  }
}
