import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/mapData_controller.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';

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
        backgroundColor:
            AppColors.primaryWhite.withOpacity(Constants.opacity25),
        foregroundColor: AppColors.primaryWhite,
        elevation: 0,
        title: Text(
          _mapDataController.getMapItem(index: mapItemIndex).title,
          style: TextStyle(color: AppColors.primaryWhite),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.account_circle_rounded),
        //     color: AppColors.primaryNormal,
        //     tooltip: 'Show Snackbar',
        //     onPressed: () {
        //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //         content: Text(
        //           "Login to your account",
        //           style: TextStyle(color: AppColors.primaryWhite),
        //         ),
        //         backgroundColor: AppColors.primaryNormal,
        //       ));
        //     },
        //   )
        // ],
      ),
      body: Column(
        children: [
          Hero(
            tag: 'mapHero' + mapItemIndex.toString(),
            child: Image.asset(
              _mapDataController.getMapItem(index: mapItemIndex).imageAsset,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Constants.insideMargin),
            child: Text(
              _mapDataController.getMapItem(index: mapItemIndex).title,
              style: Get.context!.textTheme.headline3
                  ?.copyWith(color: AppColors.primaryDark),
            ),
          ),
          Text(
            _mapDataController.getMapItem(index: mapItemIndex).subtitle,
            style: Get.context!.textTheme.headline6
                ?.copyWith(color: AppColors.primaryDark),
          ),
          Padding(padding: EdgeInsets.all(Constants.insideMargin)),
          Container(
            margin: EdgeInsets.all(Constants.insideMargin),
            child: Text(
              _mapDataController.getMapItem(index: mapItemIndex).description,
              style: Get.context!.textTheme.bodyText1
                  ?.copyWith(color: AppColors.primaryDark),
            ),
          ),
        ],
      ),
    );
  }
}
