// This class will handle data loading from FireBase

class TripItem {
  TripItem({
    this.title = "",
    this.subtitle = "",
    this.time = "",
    this.description = "",
    this.imageAsset = "",
    this.enabled = true,
  });

  String title;
  String subtitle;
  String time;
  String description;
  String imageAsset;
  bool enabled;
}

List<TripItem> generateTripItems() {
  return [
    TripItem(
      title: "W Parku",
      subtitle: "dla najmłodszych",
      time: "30",
      description:
          "Poznaj tajemnice klasztornego parku poprzez wyszukiwanie ciekawych miejsc i rozwiązywanie zadań.",
      imageAsset: "assets/images/trip_01.png",
      enabled: true,
    ),
    TripItem(
      title: "W Labiryncie",
      subtitle: "dla młodzieży",
      time: "45",
      description:
          "Wejdź do klasztornego labiryntu i odkrywaj mądrości starożytnych filozofów.",
      imageAsset: "assets/images/trip_02.png",
      enabled: true,
    ),
    TripItem(
      title: "Droga Krzyżowa",
      subtitle: "dla dorosłych",
      time: "60",
      description:
          "Towarzysz Panu Jezusowi na drodze krzyżowej w ciszy klasztornego parku.",
      imageAsset: "assets/images/trip_03.png",
      enabled: true,
    ),
  ];
}
