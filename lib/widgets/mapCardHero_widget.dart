import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/mapData_controller.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';
import 'package:gra_terenowa/view/mapCard_screen.dart';

class MapCardHero extends StatelessWidget {
  const MapCardHero({Key? key, required this.onTap, required this.mapItemIndex})
      : super(key: key);

  final VoidCallback onTap;
  final int mapItemIndex;

  @override
  Widget build(BuildContext context) {
    final MapDataController _mapDataController = Get.find();

    return Card(
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
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: Constants.minMargin),
                      alignment: Alignment.topLeft,
                      child: Text(
                        _mapDataController
                            .getMapItem(index: mapItemIndex)
                            .subtitle,
                        style: Get.context!.textTheme.bodyText2
                            ?.copyWith(color: AppColors.primaryNormal),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List<Icon>.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    size: 24,
                                    color: AppColors.primaryNormal,
                                  )),
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
                              color: AppColors.primaryLight,
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
    );
  }
}
