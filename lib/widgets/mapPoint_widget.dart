import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/mapData_controller.dart';
import 'package:gra_terenowa/controller/mapTransfer_controller.dart';
import 'package:gra_terenowa/model/mapDatabase.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';

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
              child: Icon(
                MapItem.getTypeIcon(
                    mapDataController.getMapItem(index: mapItemIndex).type),
                size: 36,
                color: AppColors.primaryWhite,
              ),
              onTap: () {
                print('pressed icon on map...');
                mapDataController.setCurrentMapIconIndex(mapItemIndex);
                mapDataController.setScrollDestinationIndex(mapItemIndex);
                // Function that scrolls the bottom card
                scrollController.animateTo(
                    (Constants.mapCardWidth + 24) * mapItemIndex,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              },
            ),
            color: mapDataController.getIconColor(mapItemIndex),
          ),
        ));
  }
}
