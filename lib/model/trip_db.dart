// This class will handle data loading from FireBase

enum TripPropertyType {
  time,
  age,
  distance,
  rating,
}

class TripItem {
  TripItem({
    this.title = "",
    this.subtitle = "",
    this.time = "",
    this.age = "",
    this.distance = "",
    this.rating = "",
    this.description = "",
    this.imageAsset = "",
    this.enabled = true,
  });

  String title;
  String subtitle;
  String time;
  String age;
  String distance;
  String rating;
  String description;
  String imageAsset;
  bool enabled;

  /// timeStr = "czas"
  static const String timeStr = "czas";

  /// minuteStr = "min"
  static const String minuteStr = "min";

  /// kilometerStr = "km"
  static const String kilometerStr = "km";

  /// ageStr = "wiek"
  static const String ageStr = "wiek";

  /// distanceStr = "dystans"
  static const String distanceStr = "dystans";

  /// ratingStr = "ocena"
  static const String ratingStr = "ocena";

  static String getTypeStr(TripPropertyType type) {
    switch (type) {
      case TripPropertyType.time:
        return timeStr;
      case TripPropertyType.age:
        return ageStr;
      case TripPropertyType.distance:
        return distanceStr;
      case TripPropertyType.rating:
        return ratingStr;
      default:
        // TODO: assert here
        return "Error in getTypeStr(): unknown type";
    }
  }
}

List<TripItem> generateTripItems() {
  return [
    TripItem(
      title: "W Parku",
      subtitle: "dla najmłodszych",
      time: "30",
      age: "6+",
      distance: "1,6",
      rating: "4,8",
      description:
          "Poznaj tajemnice klasztornego parku poprzez wyszukiwanie ciekawych miejsc i rozwiązywanie zadań.",
      imageAsset: "assets/images/trip_01.png",
      enabled: true,
    ),
    TripItem(
      title: "W Labiryncie",
      subtitle: "dla młodzieży",
      time: "45",
      age: "12+",
      distance: "0,7",
      rating: "4,5",
      description:
          "Wejdź do klasztornego labiryntu i odkrywaj mądrości starożytnych filozofów.",
      imageAsset: "assets/images/trip_02.png",
      enabled: true,
    ),
    TripItem(
      title: "Droga Krzyżowa",
      subtitle: "dla dorosłych",
      time: "60",
      age: "18+",
      distance: "1,7",
      rating: "4,7",
      description:
          "Towarzysz Panu Jezusowi na drodze krzyżowej w ciszy klasztornego parku.",
      imageAsset: "assets/images/trip_03.png",
      enabled: true,
    ),
  ];
}
