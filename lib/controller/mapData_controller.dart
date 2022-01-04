import 'package:get/get.dart';
import 'package:gra_terenowa/model/mapDatabase.dart';

class MapDataController extends GetxController {
  /// Holds all map items
  final _mapData = generateMapData();
  RxInt _currentMapItemIndex = 0.obs;
  RxInt _scrollDestinationIndex = 0.obs;

  MapItem getMapItem({required int index}) {
    return _mapData.mapItems[index];
  }

  MapItem getCurrentMapItem() {
    return _mapData.mapItems[_currentMapItemIndex.value];
  }

  getLength() => _mapData.mapItems.length;

  getCurrentMapItemIndex() => _currentMapItemIndex.value;
  setCurrentMapItemIndex(int index) => _currentMapItemIndex.value = index;

  getScrollDestinationIndex() => _scrollDestinationIndex.value;
  setScrollDestinationIndex(int index) => _scrollDestinationIndex.value = index;

  getMapInitX() => _mapData.initX;
  getMapInitY() => _mapData.initY;
}
