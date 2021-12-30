/// This controller manages database requests and completely separates data from view
///

import 'package:get/get.dart';
import 'package:gra_terenowa/model/database.dart';

class TripDataController extends GetxController {
  /// Holds data for all available trips
  final _tripData = generateTripItems();

  TripItem getTripItem({required int index}) {
    return _tripData[index];
  }

  List<StepItem> getStepList({required int tripIndex}) {
    return _tripData[tripIndex].stepList;
  }

  StepItem getStepItem({required TripDataSelect tripDataSelect}) {
    return _tripData[tripDataSelect.tripIndex]
        .stepList[tripDataSelect.stepIndex];
  }

  StepItem getPrevStepItem({required TripDataSelect tripDataSelect}) {
    assert(tripDataSelect.stepIndex - 1 >= 0,
        'previous stepIndex must be valid: greater than 0');
    return _tripData[tripDataSelect.tripIndex]
        .stepList[tripDataSelect.stepIndex - 1];
  }

  int getNextStepIndex({required TripDataSelect tripDataSelect}) {
    return _tripData[tripDataSelect.tripIndex]
        .stepList[tripDataSelect.stepIndex]
        .nextStep;
  }

  int getPreviousStepIndex({required TripDataSelect tripDataSelect}) {
    return _tripData[tripDataSelect.tripIndex]
        .stepList[tripDataSelect.stepIndex]
        .previousStep;
  }
}

// Helper classes

/// Use to pass trip data selection parameters
class TripDataSelect {
  const TripDataSelect({
    required this.tripIndex,
    required this.stepIndex,
  });

  final int tripIndex;
  final int stepIndex;
}
