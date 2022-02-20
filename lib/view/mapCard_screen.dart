import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/mapData_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';

class MapCardPage extends StatelessWidget {
  const MapCardPage({
    Key? key,
    required this.mapItemIndex,
  }) : super(key: key);

  final int mapItemIndex;

  @override
  Widget build(BuildContext context) {
    final MapDataController _mapDataController = Get.find();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColors.primaryNormal,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.primaryWhite,
        elevation: 0, // no shadow
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryNormal.withOpacity(Constants.opacity75),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: AppColors.primaryWhite,
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          // Padding to avoid status bar
          SizedBox(
            height: MediaQueryData.fromWindow(window).padding.top,
          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Hero(
                tag: 'mapHero' + mapItemIndex.toString(),
                child: Image.asset(
                  _mapDataController.getMapItem(index: mapItemIndex).imageAsset,
                  fit: BoxFit.fill,
                ),
              ),
              // Draw a decoration with rounded corners at the bottom of image
              Positioned(
                bottom: 0,
                child: Container(
                    width: Get.width,
                    height: Constants.borderRadius,
                    decoration: BoxDecoration(
                        color: AppColors.primaryWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Constants.borderRadius),
                          topRight: Radius.circular(Constants.borderRadius),
                        )),
                    child: SizedBox.shrink()),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(Constants.insideMargin, 0,
                  Constants.insideMargin, Constants.cardMargin),
              children: [
                Center(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: Constants.cardMargin),
                    child: Text(
                      _mapDataController.getMapItem(index: mapItemIndex).title,
                      style: Get.context!.textTheme.headline3
                          ?.copyWith(color: AppColors.primaryDark),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    _mapDataController.getMapItem(index: mapItemIndex).subtitle,
                    style: Get.context!.textTheme.headline6
                        ?.copyWith(color: AppColors.primaryDark),
                  ),
                ),
                Padding(padding: EdgeInsets.all(Constants.cardMargin)),
                Container(
                  margin: EdgeInsets.all(Constants.insideMargin),
                  child: Text(
                    _mapDataController
                        .getMapItem(index: mapItemIndex)
                        .description,
                    style: Get.context!.textTheme.bodyText1
                        ?.copyWith(color: AppColors.primaryDark),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
