import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/mapData_controller.dart';
import 'package:kompas/controller/mapTransfer_controller.dart';
import 'package:kompas/model/mapDatabase.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:badges/badges.dart' as badges;

class MapPoint extends StatelessWidget {
  MapPoint({
    Key? key,
    required this.mapDataController,
    required this.mapTransformController,
    required this.mapItemIndex,
    required this.scrollController,
  }) : super(key: key);

  final MapDataController mapDataController;
  final MapTransformController mapTransformController;
  final int mapItemIndex;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: mapDataController.getMapItem(index: mapItemIndex).locationX,
        top: mapDataController.getMapItem(index: mapItemIndex).locationY,
        child: Obx(
          () => Card(
            elevation: 8,
            child: InkWell(
              child: Container(
                padding: EdgeInsets.all(Constants.minMargin),
                child: badges.Badge(
                  badgeStyle: badges.BadgeStyle(badgeColor: AppColors.accentContrast),
                  showBadge: mapDataController.getMapItem(index: mapItemIndex).tripIndexLink != -1,
                  child: Icon(
                    MapItem.getTypeIcon(mapDataController.getMapItem(index: mapItemIndex).type),
                    size: 32,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ),
              onTap: () {
                //print('pressed icon on map...');
                mapDataController.setCurrentMapIconIndex(mapItemIndex);
                mapDataController.setScrollDestinationIndex(mapItemIndex);
                // Function that scrolls the bottom card
                scrollController.animateTo(
                  (Constants.mapCardWidth + 24) * mapItemIndex,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              },
            ),
            color: mapDataController.getIconColor(mapItemIndex),
          ),
        ));
  }
}
