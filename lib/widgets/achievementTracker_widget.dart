import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/achievementTracker_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/kompasText.dart';
import 'package:kompas/statics/text_styles.dart';

class AchievementTracker extends StatelessWidget {
  const AchievementTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AchievementTrackerController _achievementTrackerController = Get.find();

    return ExpansionTile(
        iconColor: AppColors.accentSelect,
        textColor: AppColors.accentSelect,
        title: KompasText(
          style: AppTextStyles.headerH5,
          text: "Osiągnięcia",
        ),
        subtitle: KompasText(
            style: AppTextStyles.paragraphSubtext,
            text: "Sprawdź ile zdobyłeś punktów za dobre odpowiedzi w przygodach."),
        leading: Image.asset("assets/images/icons/winner_cup.png", scale: 5),
        children: [
          Container(
            margin: EdgeInsets.all(Constants.insideMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: KompasText(
                      style: AppTextStyles.headerH5,
                      text: "Punkty za dobre odpowiedzi:",
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Obx(
                    () => KompasText(
                      style: AppTextStyles.headerH5,
                      text: "${_achievementTrackerController.readAnswerScore()}",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Constants.insideMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: KompasText(
                    style: AppTextStyles.headerH5,
                    text: "Punkty za ukończone przygody:",
                  ),
                ),
                Obx(
                  () => KompasText(
                    style: AppTextStyles.headerH5,
                    text: "${_achievementTrackerController.readTripScore()}",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Constants.cardMargin),
        ]);
  }
}
