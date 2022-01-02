import 'package:flutter/material.dart';
import 'package:gra_terenowa/controller/mapTransfer_controller.dart';
import 'package:gra_terenowa/statics/colors.dart';

class MapView extends StatefulWidget {
  const MapView({
    Key? key,
  }) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView>
    with AutomaticKeepAliveClientMixin<MapView> {
  @override
  bool get wantKeepAlive =>
      true; // prevent view from reloading and preserves current view
  @override
  Widget build(BuildContext context) {
    super.build(context); // need to call super method.
    MapTransformController controller = MapTransformController(-520, -80);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 36),
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
            controller.setView(-650, -100);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Jesteś tutaj!",
                  style: TextStyle(color: AppColors.primaryWhite),
                ),
                backgroundColor: AppColors.primaryNormal,
              ),
            );
          },
        ),
      ),
      body: InteractiveViewer(
        constrained: false,
        transformationController: controller,
        child: Stack(
          children: [
            Image.asset("assets/images/wsd_map.png"),
            Positioned(
              child: IconButton(
                iconSize: 48,
                icon: Icon(Icons.location_on, size: 36),
                color: AppColors.accentRed,
                onPressed: () {
                  print('Pin pressed...');
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Jesteś tutaj!",
                      style: TextStyle(color: AppColors.primaryWhite),
                    ),
                    backgroundColor: AppColors.primaryNormal,
                  ));
                },
              ),
              top: 320,
              right: 620,
            ),
          ],
        ),
        onInteractionStart: (ScaleStartDetails scaleStartDetails) {
          // print('Interaction Start - Focal point: ${scaleStartDetails.focalPoint}'
          //     ', Local focal point: ${scaleStartDetails.localFocalPoint}');
        },
        onInteractionEnd: (ScaleEndDetails scaleEndDetails) {
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
    );
  }
}
