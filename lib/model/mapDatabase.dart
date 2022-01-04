/// This class will handle data loading from FireBase

import 'package:flutter/material.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';

enum MapItemType {
  building_large,
  building_small,
  house,
  tree,
  plant,
  info,
  pin,
}

class MapData {
  MapData({
    required this.mapItems,
    this.uid = "",
    this.initX = 0,
    this.initY = 0,
  });

  String uid;
  List<MapItem> mapItems;
  double initX;
  double initY;
}

/// API for map item data
///
class MapItem {
  MapItem({
    required this.locationX,
    required this.locationY,
    this.initX = 0,
    this.initY = 0,
    this.uid = "", // TODO: add uid generator
    this.imageAsset = Constants.defaultImage,
    this.type = MapItemType.house,
    this.title = "Title",
    this.subtitle = "Subtitle",
    this.rating = "5.0",
    this.description = "Description",
    this.color = AppColors.primaryNormal,
    this.enabled = true,
  });

  String uid;
  String imageAsset;
  MapItemType type;
  double locationX;
  double initX;
  double locationY;
  double initY;
  String title;
  String subtitle;
  String rating;
  String description;
  Color color;
  bool enabled;

  static IconData getTypeIcon(MapItemType type) {
    switch (type) {
      case MapItemType.building_large:
        return Icons.location_city_rounded;
      case MapItemType.building_small:
        return Icons.home_work_rounded;
      case MapItemType.house:
        return Icons.home_rounded;
      case MapItemType.tree:
        return Icons.park_rounded;
      case MapItemType.plant:
        return Icons.grass_rounded;
      case MapItemType.info:
        return Icons.local_library_rounded;
      case MapItemType.pin:
      default:
        return Icons.location_on;
    }
  }
}

/// Generates data for all map items
/// Future work: dynamically load data from online DB (Firebase)
MapData generateMapData() {
  return MapData(
    initX: 630,
    initY: 400,
    mapItems: [
      MapItem(
        locationX: 630,
        locationY: 400,
        uid: '01', // TODO: implement proper UID
        imageAsset: Constants.defaultImage,
        type: MapItemType.building_large,
        title: 'Zamek',
        subtitle: 'WSD Salwatorianów',
        description:
            'W tym miejscu znajduje się Wyższe Seminarium Duchowne Salwatorianów w Bagnie...',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 600,
        locationY: 800,
        uid: '02', // TODO: implement proper UID
        imageAsset: Constants.defaultImage,
        type: MapItemType.house,
        title: 'Diaspora',
        subtitle: 'drewniana kapliczka',
        description: 'W tym miejscu znajduje się diaspora...',
        rating: '5,0',
        enabled: true,
      ),
      // MapItem(
      //   locationX: 830,
      //   locationY: 320,
      //   uid: '03', // TODO: implement proper UID
      //   imageAsset: Constants.defaultImage,
      //   type: MapItemType.pin,
      //   title: 'Jesteś tutaj',
      //   subtitle: 'szukam GPS...',
      //   description: 'GPS wskazuje, że znajdujesz się w tym miejscu.',
      //   color: AppColors.accentRed,
      //   rating: '5,0',
      //   enabled: false,
      // ),
      MapItem(
        locationX: 760,
        locationY: 570,
        uid: '04', // TODO: implement proper UID
        imageAsset: Constants.defaultImage,
        type: MapItemType.house,
        title: 'Grota Matki Bożej',
        subtitle: 'miejsce modlitwy',
        description: 'W tym miejscu znajduje się grota Matki Bożej z Lourdes.',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 865,
        locationY: 420,
        uid: '05', // TODO: implement proper UID
        imageAsset: Constants.defaultImage,
        type: MapItemType.house,
        title: 'Altanka filozofów',
        subtitle: 'miejsce odpoczynku',
        description: 'W tym miejscu znajduje się Altanka Filozofów',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 440,
        locationY: 390,
        uid: '06', // TODO: implement proper UID
        imageAsset: Constants.defaultImage,
        type: MapItemType.tree,
        title: 'Buk płaczący',
        subtitle: 'ciekawe drzewo',
        description: 'W tym miejscu znajduje się buk płaczący',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 290,
        locationY: 410,
        uid: '07', // TODO: implement proper UID
        imageAsset: Constants.defaultImage,
        type: MapItemType.building_small,
        title: 'Nowicjat',
        subtitle: 'dom formacyjny',
        description: 'W tym miejscu znajduje się nowicjat.',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 210,
        locationY: 210,
        uid: '08', // TODO: implement proper UID
        imageAsset: Constants.defaultImage,
        type: MapItemType.building_small,
        title: 'Dom "ToTu"',
        subtitle: 'apostolaty RMS i SOP',
        description: 'W tym miejscu znajduje się dom młodzieżowy "ToTu".',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 1000,
        locationY: 600,
        uid: '09', // TODO: implement proper UID
        imageAsset: Constants.defaultImage,
        type: MapItemType.plant,
        title: 'Ogród zakonny',
        subtitle: 'miejsce naszej pracy',
        description: 'W tym miejscu znajduje się ogród zakonny',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 950,
        locationY: 430,
        uid: '10', // TODO: implement proper UID
        imageAsset: Constants.defaultImage,
        type: MapItemType.info,
        title: 'Labirynt Filozofów',
        subtitle: 'dla szukających mądrości',
        description: 'W tym miejscu znajduje się labirynt filozofów',
        rating: '5,0',
        enabled: true,
      ),
    ],
  );
}
