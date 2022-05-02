import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/mapData_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/kompasText.dart';
import 'package:kompas/statics/text_styles.dart';
import 'package:kompas/view/trip_screen.dart';

class MapCardBottomSheet extends StatelessWidget {
  const MapCardBottomSheet({Key? key, required this.selectedIndex}) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final MapDataController _mapDataController = Get.find();
    final double _sheetSizePercent =
        (Get.height * Constants.tripBottomSheetRatio + Constants.borderRadius) / Get.height;

    return makeDismissible(
      child: DraggableScrollableSheet(
        initialChildSize: _sheetSizePercent,
        maxChildSize: 1.0,
        minChildSize: _sheetSizePercent / 3,
        snapSizes: [_sheetSizePercent],
        snap: true,
        builder: (BuildContext context, ScrollController scrollController) => Container(
          // bottomsheet starts 60% lower because it is without an image at the top
          height: _sheetSizePercent * Get.height,
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(Constants.borderRadius)),
          ),
          child: ListView(
            padding: EdgeInsets.all(Constants.insideMargin),
            controller: scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, Constants.cardMargin),
                child: Center(
                  child: Icon(
                    Icons.maximize_rounded,
                    color: AppColors.primaryNormal,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: Constants.cardMargin),
                  child: Text(
                    _mapDataController.getMapItem(index: selectedIndex).title,
                    style: AppTextStyles.headerH3.copyWith(color: AppColors.primaryDark),
                  ),
                ),
              ),
              Center(
                child: Text(
                  _mapDataController.getMapItem(index: selectedIndex).subtitle,
                  style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryDark),
                ),
              ),
              Padding(padding: EdgeInsets.all(Constants.cardMargin)),
              Container(
                margin: EdgeInsets.all(Constants.insideMargin),
                child: Text(
                  _mapDataController.getMapItem(index: selectedIndex).description,
                  style: AppTextStyles.paragraphText.copyWith(color: AppColors.primaryDark),
                ),
              ),
              // Add a link button to the appropriate trip if needed
              (_mapDataController.getMapItem(index: selectedIndex).tripIndexLink != -1)
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(
                          Constants.insideMargin, Constants.cardMargin, Constants.insideMargin, Constants.endMargin),
                      child: OutlinedButton(
                        child: KompasText(
                          text: "Zaczynamy",
                          style: AppTextStyles.headerH3.copyWith(color: AppColors.primaryWhite),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(
                              Constants.endMargin, Constants.bottomMargin, Constants.endMargin, Constants.bottomMargin),
                          primary: AppColors.primaryWhite,
                          backgroundColor: AppColors.primaryNormal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Constants.borderRadius),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => TripPage(
                                tripIndex: _mapDataController.getMapItem(index: selectedIndex).tripIndexLink,
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
    );
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Get.back(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
}
