import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/app_controller.dart';
import 'package:gra_terenowa/controller/trip_db_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/routes.dart';
import 'package:gra_terenowa/extras/statics.dart';
import 'package:gra_terenowa/model/trip_db.dart';
import 'package:gra_terenowa/widgets/tripStepSelectBox_widget.dart';

/// Displays trip content based on step type
class TripStepSwitch extends StatelessWidget {
  const TripStepSwitch({
    Key? key,
    required this.tripController,
    required this.tripSelect,
  }) : super(key: key);

  final TripDBController tripController;
  final TripSelect tripSelect;

  @override
  Widget build(BuildContext context) {
    final AppController _appController = Get.find();
    switch (tripController.getStepItem(tripSelect: tripSelect).type) {
      case StepType.info:
        return Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                tripController.getStepItem(tripSelect: tripSelect).title,
                style: Get.context!.textTheme.headline3
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                tripController.getStepItem(tripSelect: tripSelect).description,
                style: Get.context!.textTheme.bodyText1
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ),
          ],
        );
      case StepType.select:
        return GridView.count(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: Statics.insideMargin,
          mainAxisSpacing: Statics.insideMargin,
          children: [
            TripStepSelectBox(
              selectionNum: 1,
              text:
                  tripController.getStepItem(tripSelect: tripSelect).selection1,
              boxColor: AppColors.selectionBlue,
            ),
            TripStepSelectBox(
              selectionNum: 2,
              text:
                  tripController.getStepItem(tripSelect: tripSelect).selection2,
              boxColor: AppColors.selectionPink,
            ),
            TripStepSelectBox(
              selectionNum: 3,
              text:
                  tripController.getStepItem(tripSelect: tripSelect).selection3,
              boxColor: AppColors.selectionViolet,
            ),
            TripStepSelectBox(
              selectionNum: 4,
              text:
                  tripController.getStepItem(tripSelect: tripSelect).selection4,
              boxColor: AppColors.selectionYellow,
            ),
          ],
        );
      case StepType.answer:
        return Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                tripController.getStepItem(tripSelect: tripSelect).title,
                style: Get.context!.textTheme.headline3
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ),
            if (_appController.getCurrentAnswer() ==
                tripController.getRunAnswer(tripSelect: tripSelect))
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: Text(
                  tripController
                      .getStepItem(tripSelect: tripSelect)
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
                  tripController
                      .getStepItem(tripSelect: tripSelect)
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
                tripController.getStepItem(tripSelect: tripSelect).title,
                style: Get.context!.textTheme.headline3
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Text(
                tripController.getStepItem(tripSelect: tripSelect).description,
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
                    _appController.resetCurrentRun();
                    Get.until((route) => Get.currentRoute == AppRoutes.home);
                  },
                ),
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
