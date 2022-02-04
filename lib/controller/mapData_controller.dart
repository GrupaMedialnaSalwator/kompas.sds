import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/mapTransfer_controller.dart';
import 'package:gra_terenowa/model/mapDatabase.dart';
import 'package:gra_terenowa/statics/colors.dart';

class MapDataController extends GetxController
    with GetSingleTickerProviderStateMixin {
  /// Holds all map items
  late MapData _mapData;
  late AnimationController _animationController;
  late Animation<Matrix4> _animation;
  MapTransformController _controller = MapTransformController();
  RxInt _currentMapIconIndex = 0.obs;
  RxInt _scrollDestinationIndex = 0.obs;

  // TODO: refactor entire class and cleanup memory leaks
  @override
  void onInit() {
    _currentMapIconIndex.value = -1;
    _mapData = generateMapData();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    _animation = Matrix4Tween(
            begin: Matrix4.identity(), end: Matrix4.identity())
        .animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));
    super.onInit();
  }

  void setupMapAnimation(MapTransformController controller) {
    _controller = controller;

    _animation.addListener(_animationListener);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animation.removeListener(_animationListener);
        _animationController.reset();
      }
    });
  }

  void _animationListener() {
    _controller.value = _animation.value;
  }

  void navigateFromToPoint({required Matrix4 start, required Matrix4 end}) {
    _animation = Matrix4Tween(begin: start, end: end).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));
    _mapNavigatePlay();
  }

  void _mapNavigatePlay() async {
    await _animationController.forward();
  }

  Color? getIconColor(int index) {
    if (_currentMapIconIndex.value == -1) {
      return AppColors.primaryNormal;
    } else if (_currentMapIconIndex.value == index) {
      return AppColors.accentRed;
    } else {
      return AppColors.primaryNormal;
    }
  }

  getAnimationX() => _animation.value.row0.w;
  getAnimationY() => _animation.value.row1.w;

  MapItem getMapItem({required int index}) {
    return _mapData.mapItems[index];
  }

  MapItem getCurrentMapItem() {
    return _mapData.mapItems[_currentMapIconIndex.value];
  }

  getLength() => _mapData.mapItems.length;

  getCurrentMapIconIndex() => _currentMapIconIndex.value;
  setCurrentMapIconIndex(int index) => _currentMapIconIndex.value = index;

  getScrollDestinationIndex() => _scrollDestinationIndex.value;
  setScrollDestinationIndex(int index) => _scrollDestinationIndex.value = index;

  getMapInitX() => _mapData.initX;
  getMapInitY() => _mapData.initY;

  getMapGPSMinX() => _mapData.gpsMinX;
  getMapGPSMinY() => _mapData.gpsMinY;
  getMapGPSMaxX() => _mapData.gpsMaxX;
  getMapGPSMaxY() => _mapData.gpsMaxY;
  getMapGPSMapSizeX() => _mapData.mapSizeX;
  getMapGPSMapSizeY() => _mapData.mapSizeY;
}
