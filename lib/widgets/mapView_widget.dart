import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/mapData_controller.dart';
import 'package:gra_terenowa/controller/mapTransfer_controller.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';
import 'package:gra_terenowa/widgets/mapCardHero_widget.dart';
import 'package:gra_terenowa/widgets/mapPoint_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';

class MapView extends StatefulWidget {
  const MapView({
    Key? key,
  }) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView>
    with AutomaticKeepAliveClientMixin<MapView> {
  MapDataController mapDataController = Get.find();
  final _scrollController = ScrollController();

  @override
  bool get wantKeepAlive =>
      true; // prevent view from reloading and preserves current view
  @override
  Widget build(BuildContext context) {
    super.build(context); // need to call super method.
    MapTransformController controller = MapTransformController.init(
        mapDataController.getMapInitX(), mapDataController.getMapInitY());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(
            0, 0, 0, Constants.mapCardHeight - Constants.buttonMargin),
        child: FloatingActionButton(
          elevation: 8,
          //isExtended: true,
          child: Icon(
            Icons.location_on,
            size: 36,
            color: AppColors.accentRed,
          ),
          backgroundColor: AppColors.primaryWhite,
          onPressed: () {
            controller.setViewCenter(680, 400); // TODO: current place on GPS
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Szukam sygnału GPS...",
                  style: TextStyle(color: AppColors.primaryWhite),
                ),
                backgroundColor: AppColors.primaryNormal,
                behavior: SnackBarBehavior.fixed,
                duration: Duration(seconds: 3),
              ),
            );
          },
        ),
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
                      mapItemIndex: index,
                      mapDataController: mapDataController,
                      scrollController: _scrollController,
                    ),
                  ),
            ),
            onInteractionStart: (ScaleStartDetails scaleStartDetails) {
              // print('Interaction Start - Focal point: ${scaleStartDetails.focalPoint}'
              //     ', Local focal point: ${scaleStartDetails.localFocalPoint}');
            },
            onInteractionEnd: (ScaleEndDetails scaleEndDetails) {
              // user clicked on the map view
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
                    print('tapped MapCardHero');
                    // center the map view on the item icon
                    controller.setViewCenter(
                        mapDataController.getMapItem(index: index).locationX,
                        mapDataController.getMapItem(index: index).locationY);
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
