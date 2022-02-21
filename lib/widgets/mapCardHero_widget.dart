import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/mapData_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/view/mapCard_screen.dart';

class MapCardHero extends StatelessWidget {
  const MapCardHero({Key? key, required this.onTap, required this.mapItemIndex})
      : super(key: key);

  final VoidCallback onTap;
  final int mapItemIndex;

  @override
  Widget build(BuildContext context) {
    final MapDataController _mapDataController = Get.find();

    return Obx(() => Card(
          elevation: 8,
          color: AppColors.primaryWhite,
          margin: EdgeInsets.all(Constants.cardMargin),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () {
              onTap();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: Constants.mapCardHeight,
                    width: Constants.mapCardWidth * (1 / 3),
                    child: Hero(
                      tag: 'mapHero' + mapItemIndex.toString(),
                      child: Container(
                        child: Image.asset(
                          _mapDataController
                              .getMapItem(index: mapItemIndex)
                              .imageAsset,
                          fit: BoxFit.cover,
                          gaplessPlayback:
                              true, // prevents flicker on switching images
                        ),
                      ),
                    )),
                SizedBox(
                  height: Constants.mapCardHeight,
                  width: Constants.mapCardWidth * (2 / 3),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            _mapDataController
                                .getMapItem(index: mapItemIndex)
                                .title,
                            style: Get.context!.textTheme.headline5
                                ?.copyWith(color: AppColors.primaryDark),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Constants.minMargin),
                          alignment: Alignment.topLeft,
                          child: Text(
                            _mapDataController
                                .getMapItem(index: mapItemIndex)
                                .subtitle,
                            style: Get.context!.textTheme.bodyText2
                                ?.copyWith(color: AppColors.primaryNormal),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: generateStars(_mapDataController
                                  .getMapItem(index: mapItemIndex)
                                  .rating),
                            ),
                            IconButton(
                                onPressed: () => {
                                      print('info pressed...'),
                                      Get.to(
                                        () => MapCardPage(
                                          mapItemIndex: mapItemIndex,
                                        ),
                                      ),
                                    },
                                icon: Icon(
                                  Icons.info_outline_rounded,
                                  size: 36,
                                  //color: AppColors.primaryLight,
                                  color: _mapDataController
                                      .getIconColor(mapItemIndex),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.borderRadius),
          ),
        ));
  }

  List<Icon> generateStars(double rating) {
    return List<Icon>.generate(5, (index) {
      // full stars
      if (rating >= (index + 1)) {
        return Icon(
          Icons.star,
          size: 24,
          color: AppColors.primaryNormal,
        );
      }
      // half-stars
      else if ((rating - index) > 0) {
        return Icon(
          Icons.star_half,
          size: 24,
          color: AppColors.primaryNormal,
        );
      }
      // empty stars
      else {
        return Icon(
          Icons.star_border,
          size: 24,
          color: AppColors.primaryNormal,
        );
      }
    });
  }
}
