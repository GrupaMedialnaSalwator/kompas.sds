/// This controller manages state of the current trip
///

import 'package:get/get.dart';

class TripStateController extends GetxController {
  /// Manages the current trip and step index
  int _currentTrip = -1;
  RxInt _currentStep = 0.obs;
  RxInt _currentPoints = 0.obs;

  /// holds value of currently selected answer
  int _currentAnswer = -1; // TODO: this is invalid - make a static const and check for it later
  bool _skipIntro = false;

  void resetState() {
    _currentTrip = -1;
    _currentStep.value = 0;
    _currentPoints.value = 0;
  }

  int getCurrentPoints() {
    return _currentPoints.value;
  }

  void incrementCurrentPoints() {
    _currentPoints.value++;
  }

  int getCurrentTrip() {
    return _currentTrip;
  }

  void setCurrentTrip(int index) {
    assert(index >= 0, '_currentTrip must be >= 0');
    _currentTrip = index;
  }

  int getCurrentStep() {
    return _currentStep.value;
  }

  void setSkipIntro(bool value) {
    if (value) {
      _currentStep.value = 1;
    }
    _skipIntro = value;
  }

  bool getSkipIntro() {
    return _skipIntro;
  }

  void gotoStepView(int step) {
    print('_currentStep = ' + _currentStep.value.toString());
    _currentStep.value = step;
  }

  void gotoPreviousStep(int previousStep) {
    print('_currentStep = ' + _currentStep.value.toString());
    _currentStep.value = previousStep;
  }

  int getCurrentAnswer() {
    return _currentAnswer;
  }

  void setCurrentAnswer(int answer) {
    assert(answer >= 0, '_currentAnswer must be >= 0');
    _currentAnswer = answer;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
