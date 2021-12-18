import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/trip_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';

Widget selectTripSheet({
  void Function()? onTapButton,
  required int tripIndex,
}) {
  final TripController _tripController = Get.find();
  return Container(
    height: Get.height,
    child: Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            _tripController.getTripItem(index: tripIndex).imageAsset,
            width: Get.width,
            height: Get.height * 0.4,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          top: Get.height * 0.4 - 20,
          child: Container(
            width: Get.width,
            height: Get.height * 0.6 + 20,
            decoration: BoxDecoration(
              color: AppColors.primaryNormal,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.zero,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    _tripController.getTripItem(index: tripIndex).title,
                    style: Get.context!.textTheme.headline3
                        ?.copyWith(color: AppColors.primaryWhite),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    _tripController.getTripItem(index: tripIndex).description,
                    style: Get.context!.textTheme.bodyText1
                        ?.copyWith(color: AppColors.primaryWhite),
                  ),
                ),
                Padding(padding: EdgeInsets.all(60)),
                TextButton(
                  child: Text("Zaczynamy"),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ))),
                  onPressed: () {
                    print('Pressed');
                    //Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
