import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/mapData_controller.dart';
import 'package:kompas/helper/roundedClipPath.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/kompasText.dart';
import 'package:kompas/statics/text_styles.dart';
import 'package:kompas/view/trip_screen.dart';

class MapCardPage extends StatelessWidget {
  MapCardPage({
    Key? key,
    required this.mapItemIndex,
  }) : super(key: key);

  final int mapItemIndex;
  final ScrollController _scrollController = ScrollController(keepScrollOffset: false);

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
              ClipPath(
                clipper: RoundedClipPath(),
                child: Hero(
                  tag: 'mapHero' + mapItemIndex.toString(),
                  child: Image.asset(
                    _mapDataController.getMapItem(index: mapItemIndex).imageAsset,
                    fit: BoxFit.fill,
                    gaplessPlayback: true, // prevents flicker on switching images
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              child: ListView(
                controller: _scrollController,
                padding: EdgeInsets.fromLTRB(Constants.insideMargin, 0, Constants.insideMargin, Constants.cardMargin),
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: Constants.cardMargin),
                      child: Text(
                        _mapDataController.getMapItem(index: mapItemIndex).title,
                        style: AppTextStyles.headerH3.copyWith(color: AppColors.primaryDark),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      _mapDataController.getMapItem(index: mapItemIndex).subtitle,
                      style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryDark),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(Constants.cardMargin)),
                  Container(
                    margin: EdgeInsets.all(Constants.insideMargin),
                    child: Text(
                      _mapDataController.getMapItem(index: mapItemIndex).description,
                      style: AppTextStyles.paragraphText.copyWith(color: AppColors.primaryDark),
                    ),
                  ),
                  // Add a link button to the appropriate trip if needed
                  (_mapDataController.getMapItem(index: mapItemIndex).tripIndexLink != -1)
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(Constants.insideMargin, Constants.cardMargin,
                              Constants.insideMargin, Constants.endMargin),
                          child: OutlinedButton(
                            child: KompasText(
                              text: "Zaczynamy",
                              style: AppTextStyles.headerH3.copyWith(color: AppColors.primaryWhite),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(Constants.endMargin, Constants.bottomMargin,
                                  Constants.endMargin, Constants.bottomMargin),
                              primary: AppColors.primaryWhite,
                              backgroundColor: AppColors.primaryNormal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Constants.borderRadius),
                              ),
                            ),
                            onPressed: () {
                              Get.to(() => TripPage(
                                    tripIndex: _mapDataController.getMapItem(index: mapItemIndex).tripIndexLink,
                                    skipIntro: true, // skip the first intro step
                                  ));
                            },
                          ),
                        )
                      : // Placeholder
                      SizedBox(width: Constants.minMargin),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
