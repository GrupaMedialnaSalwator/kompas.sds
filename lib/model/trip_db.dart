// This class will handle data loading from FireBase

class TripItem {
  TripItem({
    this.title = "",
    this.subtitle = "",
    this.description = "",
    this.imageAsset = "",
    this.enabled = true,
  });

  String title;
  String subtitle;
  String description;
  String imageAsset;
  bool enabled;
}

List<TripItem> generateTripItems() {
  return [
    TripItem(
      title: "W Parku",
      subtitle: "dla najmłodszych",
      description:
          "Poznaj tajemnice klasztornego parku poprzez wyszukiwanie ciekawych miejsc i rozwiązywanie zadań.",
      imageAsset: "assets/images/trip_01.png",
      enabled: true,
    ),
    TripItem(
      title: "W Labiryncie",
      subtitle: "dla młodzieży",
      description:
          "Wejdź do klasztornego labiryntu i odkrywaj mądrości starożytnych filozofów.",
      imageAsset: "assets/images/trip_02.png",
      enabled: true,
    ),
    TripItem(
      title: "Droga Krzyżowa",
      subtitle: "dla dorosłych",
      description:
          "Towarzysz Panu Jezusowi na drodze krzyżowej w ciszy klasztornego parku.",
      imageAsset: "assets/images/trip_03.png",
      enabled: true,
    ),
  ];
}