import 'package:get/get.dart';
import 'package:gra_terenowa/model/trip_db.dart';

class TripController extends GetxController {
  // This variable holds data for all trips currently loaded in the app
  final _tripData = generateTripItems().obs;

  TripItem getTripItem({required int index}) {
    return _tripData[index];
  }

  List<TripItem> getTripList() {
    return _tripData;
  }

  int getMaxTrips() {
    return _tripData.length;
  }
}
