import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/mapData_controller.dart';
import 'package:kompas/controller/mapTransfer_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
// TODO: GPS
//import 'package:kompas/widgets/gpsPoint_widget.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:kompas/services/gpsService.dart';
import 'package:kompas/widgets/mapCardHero_widget.dart';
import 'package:kompas/widgets/mapPoint_widget.dart';

class MapView extends StatelessWidget {
  MapView({
    Key? key,
  }) : super(key: key);

  MapDataController mapDataController = Get.find();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    MapTransformController controller = MapTransformController.init(
        mapDataController.getMapInitX(), mapDataController.getMapInitY());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(
            0, 0, 0, Constants.mapCardHeight - Constants.buttonMargin),
        // TODO: GPS (position floating button)
        // child: FloatingActionButton(
        //   elevation: 8,
        //   //isExtended: true,
        //   child: Icon(
        //     Icons.location_on,
        //     size: 36,
        //     color: AppColors.accentRed,
        //   ),
        //   backgroundColor: AppColors.primaryWhite,
        //   onPressed: () async {
        //     // TODO: GPS (use streams for faster gps access)
        //     var position = await determineGPSPosition().catchError((onError) {
        //       print(onError);
        //     });
        //     print(
        //       'Szukam sygnału GPS... longitude: ' +
        //           position.longitude.toString() +
        //           ', latitude: ' +
        //           position.latitude.toString(),
        //     );

        //     // center and animate the map view on the item icon
        //     var start = controller.value;
        //     var end = controller.getCenteredViewMatrixGPS(
        //       position.longitude,
        //       position.latitude,
        //       mapDataController.getMapGPSMinX(),
        //       mapDataController.getMapGPSMinY(),
        //       mapDataController.getMapGPSMaxX(),
        //       mapDataController.getMapGPSMaxY(),
        //       mapDataController.getMapGPSMapSizeX(),
        //       mapDataController.getMapGPSMapSizeY(),
        //     );
        //     mapDataController.setupMapAnimation(controller);
        //     mapDataController.navigateFromToPoint(start: start, end: end);
        //     mapDataController.setCurrentMapIconIndex(0);

        //     ScaffoldMessenger.of(context).removeCurrentSnackBar();
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //         content: Text(
        //           'Jesteś tutaj... longitude: ' +
        //               position.longitude.toString() +
        //               ', latitude: ' +
        //               position.latitude.toString(),
        //           style: TextStyle(color: AppColors.primaryWhite),
        //         ),
        //         backgroundColor: AppColors.primaryNormal,
        //         behavior: SnackBarBehavior.fixed,
        //         duration: Duration(seconds: 3),
        //       ),
        //     );
        //   },
        // ),
      ),
      body: Stack(
        children: [
          InteractiveViewer(
            constrained: false,
            transformationController: controller,
            child: Stack(
              children: List<Widget>.generate(1,
                      (int index) => Image.asset("assets/images/wsd_map.png")) +
                  List<Widget>.generate(
                    mapDataController.getLength(),
                    (int index) => MapPoint(
                      mapTransformController: controller,
                      mapItemIndex: index,
                      mapDataController: mapDataController,
                      scrollController: _scrollController,
                    ),
                    // TODO: add this segment to display icon for present gps position
                    // ) +
                    // List<Widget>.generate(
                    //   1,
                    //   (int index) => GPSPoint(
                    //     mapDataController: mapDataController,
                    //   ),
                  ),
            ),
            onInteractionStart: (ScaleStartDetails scaleStartDetails) {
              // print('Interaction Start - Focal point: ${scaleStartDetails.focalPoint}'
              //     ', Local focal point: ${scaleStartDetails.localFocalPoint}');
            },
            onInteractionEnd: (ScaleEndDetails scaleEndDetails) {
              // user clicked on the map view
              mapDataController.setCurrentMapIconIndex(-1);
              print("x=" +
                  controller.value.getTranslation().x.toString() +
                  " y=" +
                  controller.value.getTranslation().y.toString());
              // print('Interaction End - Velocity: ${scaleEndDetails.velocity}');
            },
            onInteractionUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
              // print(
              //     'Interaction Update - Focal point: ${scaleUpdateDetails.focalPoint}'
              //     ', Local focal point: ${scaleUpdateDetails.localFocalPoint}'
              //     ', Scale: ${scaleUpdateDetails.scale}'
              //     ', Horizontal scale: ${scaleUpdateDetails.horizontalScale}'
              //     ', Vertical scale: ${scaleUpdateDetails.verticalScale}'
              //     ', Rotation: ${scaleUpdateDetails.rotation}');
            },
          ),
          Positioned(
            height: Constants.mapCardHeight,
            width: Get.width,
            left: 0,
            bottom: 0,
            child: Container(
              height: Constants.mapCardHeight,
              color: AppColors.transparent,
              child: ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                //padding: EdgeInsets.all(20),
                itemCount: mapDataController.getLength(),
                separatorBuilder: (BuildContext context, int index) =>
                    VerticalDivider(
                        width: Constants.cardMargin,
                        color: AppColors.transparent),
                itemBuilder: (BuildContext context, int index) => MapCardHero(
                  mapItemIndex: index,
                  onTap: () {
                    print('tapped map card... x:' +
                        controller.getViewX().toString() +
                        ' y:' +
                        controller.getViewY().toString());

                    // center and animate the map view on the item icon
                    var start = controller.value;
                    var end = controller.getCenteredViewMatrix(
                        mapDataController.getMapItem(index: index).locationX,
                        mapDataController.getMapItem(index: index).locationY);
                    mapDataController.setupMapAnimation(controller);
                    mapDataController.navigateFromToPoint(
                        start: start, end: end);
                    mapDataController.setCurrentMapIconIndex(index);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
