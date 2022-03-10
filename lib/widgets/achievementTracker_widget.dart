import 'package:flutter/material.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:hive/hive.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/text_styles.dart';

class AchievementTracker extends StatefulWidget {
  const AchievementTracker({
    Key? key,
  }) : super(key: key);

  @override
  State<AchievementTracker> createState() => _AchievementTrackerState();
}

class _AchievementTrackerState extends State<AchievementTracker> {
  int tripScore = 0;
  int answerScore = 0;

  _AchievementTrackerState() {
    AchievementOperations().readTripScore().then((val) => setState(() {
          tripScore = val;
        }));
    AchievementOperations().readAnswerScore().then((val) => setState(() {
          answerScore = val;
        }));
  }
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        iconColor: AppColors.accentSelect,
        textColor: AppColors.accentSelect,
        title: KompasTitleText(
          text: "Osiągnięcia",
        ),
        subtitle: Text(
            "Sprawdź ile zdobyłeś punktów za dobre odpowiedzi w przygodach."),
        leading: Image.asset("assets/images/icons/winner_cup.png", scale: 5),
        children: [
          Container(
            margin: EdgeInsets.all(Constants.insideMargin),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: KompasTitleText(
                    text: "Punkty za dobre odpowiedzi:",
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: KompasTitleText(
                    text: "$answerScore",
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Constants.insideMargin),
            child: Row(
              children: [
                KompasTitleText(
                  text: "Punkty za ukończone przygody:",
                ),
                Spacer(),
                KompasTitleText(
                  text: "$tripScore",
                ),
              ],
            ),
          ),
          SizedBox(height: Constants.cardMargin),
        ]);
  }
}

class AchievementOperations {
  AchievementOperations();

  void incrementTripScore(TripDataSelect tripDataSelect) async {
    Box tripScoreBox = await Hive.openBox('TripScore');
    tripScoreBox.put(tripDataSelect.tripIndex, 1);
  }

  void incrementAnswerScore(TripDataSelect tripDataSelect) async {
    Box answerScoreBox = await Hive.openBox('AnswerScore');
    answerScoreBox.put(
        "${tripDataSelect.tripIndex}_${tripDataSelect.stepIndex}", 1);
  }

  Future<int> readTripScore() async {
    Box tripScoreBox = await Hive.openBox('TripScore');
    return tripScoreBox.length;
  }

  Future<int> readAnswerScore() async {
    Box answerScoreBox = await Hive.openBox('AnswerScore');
    return answerScoreBox.length;
  }

  Future returnTripScore() async {
    int tripScoreint = await readTripScore();
    return tripScoreint;
  }
}
