/// This controller manages database requests and completely separates data from view
///

import 'package:get/get.dart';
import 'package:gra_terenowa/model/tripDatabase.dart';

class TripDataController extends GetxController {
  /// Holds data for all available trips
  final List<TripItem> _tripData = generateTripItems();

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
