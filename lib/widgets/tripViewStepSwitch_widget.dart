import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/routes.dart';
import 'package:gra_terenowa/statics/constants.dart';
import 'package:gra_terenowa/widgets/achievementTracker_widget.dart';
import 'package:gra_terenowa/model/tripDatabase.dart';
import 'package:gra_terenowa/widgets/tripStepSelectBox_widget.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(horizontal: Constants.insideMargin),
                child: Text(
                  tripDataController
                      .getStepItem(tripDataSelect: tripDataSelect)
                      .caption,
                  style: Get.context!.textTheme.bodyText2
                      ?.copyWith(color: AppColors.primaryNormal),
                      textAlign: TextAlign.center
                ),
              ),
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
        if (_correctAnswer())
          AchievementOperations().incrementAnswerScore(tripDataSelect);
        //AchievementScore.addAnswerScore; //TODO: mk where should achievementScore (an instance of AchievementScore class) be instantiated?
        //TODO: mk how can I keep score even if the app is closed?
        //TODO: introduce achievements class where score for correct answers and finished trips is keps
        //TODO: initialize with 0, add methods for adding score and add logic for not counting score and finished trips twice
        //TODO remove mk
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
              if (_correctAnswer())
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
        AchievementOperations().incrementTripScore(tripDataSelect);
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

  bool _correctAnswer() {
    return (tripStateController.getCurrentAnswer() ==
        tripDataController
            .getStepItem(
                tripDataSelect: TripDataSelect(
                    tripIndex: 0,
                    stepIndex: tripStateController.getCurrentStep()))
            .correctSelection);
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

String getAnswerText(
    {required TripStateController tripStateController,
    required TripDataController tripDataController,
    required TripDataSelect tripDataSelect}) {
  if (tripStateController.getCurrentAnswer() ==
      tripDataController
          .getStepItem(tripDataSelect: tripDataSelect)
          .correctSelection) {
    return tripDataController
        .getStepItem(tripDataSelect: tripDataSelect)
        .correctAnswer;
  } else {
    return tripDataController
        .getStepItem(tripDataSelect: tripDataSelect)
        .incorrectAnswer;
  }
}
