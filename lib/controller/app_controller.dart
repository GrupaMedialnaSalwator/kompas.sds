import 'package:get/get.dart';

class AppController extends GetxController {
  /// Manages the current run index for trips
  RxInt _currentRun = 0.obs;

  /// holds value of currently selected answer
  int _currentAnswer = 0;

  RxInt getCurrentRun() {
    return _currentRun;
  }

  int getCurrentAnswer() {
    return _currentAnswer;
  }

  void setCurrentAnswer(int answer) {
    _currentAnswer = answer;
  }

  void resetCurrentRun() {
    _currentRun.value = 0;
  }

  void incrementCurrentRun() {
    _currentRun++;
  }

  @override
  void onInit() {
    super.onInit();
    resetCurrentRun();
  }
}
