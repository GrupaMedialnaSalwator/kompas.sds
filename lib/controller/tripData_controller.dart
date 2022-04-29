/// This controller manages database requests and completely separates data from view
///

import 'package:get/get.dart';
import 'package:kompas/model/tripDatabase.dart';

class TripDataController extends GetxController {
  /// Holds data for all available trips
  final List<TripItem> _tripData = generateTripItems();

  int getTripsLength() {
    return _tripData.length;
  }

  TripItem getTripItem({required int index}) {
    return _tripData[index];
  }

  List<StepItem> getStepList({required int tripIndex}) {
    return _tripData[tripIndex].stepList;
  }

  StepItem getStepItem({required TripDataSelect tripDataSelect}) {
    return _tripData[tripDataSelect.tripIndex].stepList[tripDataSelect.stepIndex];
  }

  bool isStepItemEndType({required TripDataSelect tripDataSelect}) {
    return (_tripData[tripDataSelect.tripIndex].stepList[tripDataSelect.stepIndex].type == StepType.end);
  }

  int getNextStepIndex({required TripDataSelect tripDataSelect}) {
    return _tripData[tripDataSelect.tripIndex].stepList[tripDataSelect.stepIndex].nextStep;
  }

  int getPreviousStepIndex({required TripDataSelect tripDataSelect}) {
    return _tripData[tripDataSelect.tripIndex].stepList[tripDataSelect.stepIndex].previousStep;
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
