import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/routes.dart';
import 'package:gra_terenowa/extras/constants.dart';
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
        return Expanded(
          child: ListView(
            padding: EdgeInsets.all(Constants.insideMargin),
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(Constants.insideMargin),
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
                margin: EdgeInsets.all(Constants.insideMargin),
                child: Text(
                  tripDataController
                      .getStepItem(tripDataSelect: tripDataSelect)
                      .description,
                  style: Get.context!.textTheme.bodyText1
                      ?.copyWith(color: AppColors.primaryDark),
                ),
              ),
            ],
          ),
        );
      case StepType.select:
        int selectionLength = tripDataController
            .getStepItem(tripDataSelect: tripDataSelect)
            .selection
            .length;
        return Expanded(
          child: GridView.count(
            padding: EdgeInsets.all(Constants.insideMargin),
            scrollDirection: getAxisLayout(),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: selectionLength ~/ 2, // truncated division
            crossAxisSpacing: Constants.insideMargin,
            mainAxisSpacing: Constants.insideMargin,
            children: List<Widget>.generate(selectionLength, (int index) {
              return TripStepSelectBox(
                tripDataSelect: tripDataSelect,
                selectionNum: index,
                boxColor: AppColors.selectionColorList[index],
              );
            }),
          ),
        );
      case StepType.answer:
        return Expanded(
          child: ListView(
            padding: EdgeInsets.all(Constants.insideMargin),
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(Constants.insideMargin),
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
                  margin: EdgeInsets.all(Constants.insideMargin),
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
                  margin: EdgeInsets.all(Constants.insideMargin),
                  child: Text(
                    tripDataController
                        .getStepItem(tripDataSelect: tripDataSelect)
                        .incorrectAnswer,
                    style: Get.context!.textTheme.bodyText1
                        ?.copyWith(color: AppColors.primaryDark),
                  ),
                ),
            ],
          ),
        );
      case StepType.end:
        return Expanded(
          child: ListView(
            padding: EdgeInsets.all(Constants.insideMargin),
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(Constants.insideMargin),
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
                margin: EdgeInsets.all(Constants.insideMargin),
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
                  padding: const EdgeInsets.all(Constants.bottomMargin),
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
                              BorderRadius.circular(Constants.borderRadius),
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
          ),
        );
      default:
        assert(false, 'TripViewStepSwitch must have a valid switch type');
        return Container();
    }
  }
}

/// Helper function
///
Axis getAxisLayout() {
  // total height minus height of top image minus height of bottom navigation
  var availableHeight = Get.height -
      (Get.width * Constants.defaultImageRatio) -
      80; // TODO: programatically find height of the navigation
  print('availableHeight = ' +
      availableHeight.toString() +
      ', screen width = ' +
      Get.width.toString());
  if (availableHeight > Get.width)
    return Axis.vertical;
  else
    return Axis.horizontal;
}
