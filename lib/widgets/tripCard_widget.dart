import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/trip_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';

Widget tripCard({
  void Function()? onTapCard,
  required double cardHeight,
  required double cardWidth,
  required int tripIndex,
}) {
  final TripController _tripController = Get.find();
  return Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: InkWell(
      onTap: () {
        if (onTapCard != null) onTapCard();
      },
      child: Stack(
        children: [
          Container(
            height: cardHeight,
            width: cardWidth,
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    _tripController.getTripItem(index: tripIndex).imageAsset),
                fit: BoxFit.fitWidth, //DecorationImage
              ),
            ), //BoxDecoration

            child: Text(
              _tripController.getTripItem(index: tripIndex).title,
              style: Get.context!.textTheme.headline3
                  ?.copyWith(color: AppColors.primaryWhite),
            ),
          ), //Text
        ],
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    elevation: 8,
    margin: EdgeInsets.all(4),
  );
}
