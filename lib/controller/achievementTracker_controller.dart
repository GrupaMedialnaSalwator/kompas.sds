import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:kompas/statics/constants.dart';

class AchievementTrackerController extends GetxController {
  RxInt _tripScore = 0.obs;
  RxInt _answerScore = 0.obs;

  AchievementTrackerController() {
    _tripScore.value = 0;
    _answerScore.value = 0;
  }

  void reloadState() async {
    Box answerScoreBox = await Hive.openBox(Constants.hiveAnswerScoreName);
    Box tripScoreBox = await Hive.openBox(Constants.hiveTripScoreName);
    _answerScore.value = answerScoreBox.length;
    _tripScore.value = tripScoreBox.length;
  }

  void incrementTripScore(String tripUID) async {
    Box tripScoreBox = await Hive.openBox(Constants.hiveTripScoreName);
    tripScoreBox.put("$tripUID", 1);
    _tripScore.value = tripScoreBox.length;
  }

  void incrementAnswerScore(String tripUID, int stepID) async {
    Box answerScoreBox = await Hive.openBox(Constants.hiveAnswerScoreName);
    answerScoreBox.put("${tripUID}_$stepID", 1);
    _answerScore.value = answerScoreBox.length;
  }

  int readTripScore() {
    return _tripScore.value;
  }

  int readAnswerScore() {
    return _answerScore.value;
  }
}
