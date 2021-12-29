import 'package:get/get.dart';
import 'package:gra_terenowa/model/trip_db.dart';

class TripDBController extends GetxController {
  /// Holds data for all trips currently loaded in the app
  final _tripData = generateTripItems().obs;

  TripItem getTripItem({required int index}) {
    return _tripData[index];
  }

  List<StepItem> getStepList({required int tripIndex, required int runIndex}) {
    return _tripData[tripIndex].runList[runIndex].stepList;
  }

  StepItem getStepItem({
    required TripSelect tripSelect,
  }) {
    return _tripData[tripSelect.tripIndex]
        .runList[tripSelect.runIndex]
        .stepList[tripSelect.stepIndex];
  }

  int getRunAnswer({
    required TripSelect tripSelect,
  }) {
    int temp = _tripData[tripSelect.tripIndex]
        .runList[tripSelect.runIndex]
        .stepList[tripSelect.stepIndex]
        .correctSelection;
    return temp;
  }

  int getCurrentRunLength({required int tripIndex, required int runIndex}) {
    return _tripData[tripIndex].runList[runIndex].stepList.length;
  }

  int getRunsLength({required int tripIndex}) {
    return _tripData[tripIndex].runList.length;
  }

  int getStepsLength({required int tripIndex, required int runIndex}) {
    return _tripData[tripIndex].runList[runIndex].stepList.length;
  }

  List<TripItem> getTripList() {
    return _tripData;
  }

  int getMaxTrips() {
    return _tripData.length;
  }
}

// Helper classes

/// Use to pass trip selection parameters
class TripSelect {
  const TripSelect({
    required this.tripIndex,
    required this.runIndex,
    required this.stepIndex,
  });

  final int tripIndex;
  final int runIndex;
  final int stepIndex;
}
