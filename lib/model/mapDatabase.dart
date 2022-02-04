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
    this.uid = "",
    required this.gpsMinX,
    required this.gpsMinY,
    required this.gpsMaxX,
    required this.gpsMaxY,
    required this.mapSizeX,
    required this.mapSizeY,
    this.initX = 0,
    this.initY = 0,
    required this.mapItems,
  });

  String uid;
  double gpsMinX;
  double gpsMinY;
  double gpsMaxX;
  double gpsMaxY;
  double mapSizeX;
  double mapSizeY;
  double initX;
  double initY;
  List<MapItem> mapItems;
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

  double locationX;
  double locationY;
  double initX;
  double initY;
  String uid;
  String imageAsset;
  MapItemType type;
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
    gpsMinX: 16.813265024669818,
    gpsMinY: 51.33952905079323,
    gpsMaxX: 16.821820563147043,
    gpsMaxY: 51.33429396425001,
    initX: 900,
    initY: 900,
    mapSizeX: 1600.0,
    mapSizeY: 1600.0,
    mapItems: [
      MapItem(
        locationX: 760,
        locationY: 790,
        uid: '01', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_01.png",
        type: MapItemType.building_large,
        title: 'Zamek',
        subtitle: 'WSD Salwatorianów',
        description:
            'W tym miejscu znajduje się Wyższe Seminarium Duchowne Salwatorianów w Bagnie...',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 730,
        locationY: 1190,
        uid: '02', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_02.png",
        type: MapItemType.house,
        title: 'Diaspora',
        subtitle: 'drewniana kapliczka',
        description: 'W tym miejscu znajduje się diaspora...',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 590,
        locationY: 1320,
        uid: '03', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_03.png",
        type: MapItemType.house,
        title: 'Pomnik',
        subtitle: 'Postument SDS',
        description: 'W tym miejscu znajduje się postument SDS...',
        rating: '4,5',
        enabled: true,
      ),
      MapItem(
        locationX: 890,
        locationY: 960,
        uid: '04', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_04.png",
        type: MapItemType.house,
        title: 'Grota Matki Bożej',
        subtitle: 'miejsce modlitwy',
        description: 'W tym miejscu znajduje się grota Matki Bożej z Lourdes.',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 990,
        locationY: 750,
        uid: '05', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_05.png",
        type: MapItemType.house,
        title: 'Pomnik',
        subtitle: 'Bł. Franciszka Jordana',
        description:
            'W tym miejscu znajduje się pomnik błogosławionego Franciszka Jordana...',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 995,
        locationY: 810,
        uid: '06', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_06.png",
        type: MapItemType.house,
        title: 'Altanka filozofów',
        subtitle: 'miejsce odpoczynku',
        description: 'W tym miejscu znajduje się Altanka Filozofów',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 570,
        locationY: 780,
        uid: '07', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_07.png",
        type: MapItemType.tree,
        title: 'Buk płaczący',
        subtitle: 'ciekawe drzewo',
        description: 'W tym miejscu znajduje się buk płaczący',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 420,
        locationY: 800,
        uid: '08', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_08.png",
        type: MapItemType.building_small,
        title: 'Nowicjat',
        subtitle: 'dom formacyjny',
        description: 'W tym miejscu znajduje się nowicjat.',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 340,
        locationY: 600,
        uid: '09', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_09.png",
        type: MapItemType.building_small,
        title: 'Dom "ToTu"',
        subtitle: 'apostolaty RMS i SOP',
        description: 'W tym miejscu znajduje się dom młodzieżowy "ToTu".',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 1130,
        locationY: 990,
        uid: '10', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_10.png",
        type: MapItemType.plant,
        title: 'Ogród zakonny',
        subtitle: 'miejsce naszej pracy',
        description: 'W tym miejscu znajduje się ogród zakonny',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 1080,
        locationY: 820,
        uid: '11', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_11.png",
        type: MapItemType.info,
        title: 'Labirynt Filozofów',
        subtitle: 'dla szukających mądrości',
        description: 'W tym miejscu znajduje się labirynt filozofów',
        rating: '5,0',
        enabled: true,
      ),
      MapItem(
        locationX: 1290,
        locationY: 205,
        uid: '11', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_12.png",
        type: MapItemType.building_large,
        title: 'Kościół',
        subtitle: 'parafialny',
        description:
            'W tym miejscu znajduje się kościół parafialny pw. Wniebowzięcia Najświętszej Maryi Panny.',
        rating: '5,0',
        enabled: true,
      ),
    ],
  );
}
