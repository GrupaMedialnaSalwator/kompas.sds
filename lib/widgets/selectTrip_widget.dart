import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/model/tripDatabase.dart';
import 'package:kompas/statics/kompasText.dart';
import 'package:kompas/statics/text_styles.dart';
import 'package:kompas/view/trip_screen.dart';
import 'package:kompas/widgets/tripProperty_widget.dart';

class SelectTrip extends StatelessWidget {
  const SelectTrip(
      {Key? key, required this.onTapButton, required this.tripIndex})
      : super(key: key);

  final VoidCallback onTapButton;
  final int tripIndex;

  @override
  Widget build(BuildContext context) {
    final TripDataController _tripDataController = Get.find();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: Constants.tripBottomSheetRatio,
      minChildSize: Constants.tripBottomSheetRatio / 3,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.primaryNormal,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(Constants.borderRadius),
            ),
          ),
          child: Stack(
            children: [
              // The main scrollable content
              Padding(
                padding: EdgeInsets.only(top: 40), // space for drag handle
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Constants.borderRadius),
                    // padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            _tripDataController
                                .getTripItem(index: tripIndex)
                                .title,
                            style: AppTextStyles.headerH3
                                .copyWith(color: AppColors.primaryWhite),
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: KompasText(
                              text: _tripDataController
                                  .getTripItem(index: tripIndex)
                                  .description,
                              style: AppTextStyles.paragraphText
                                  .copyWith(color: AppColors.primaryWhite),
                              maxLines: 3,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TripProperty(
                              text: _tripDataController
                                  .getTripItem(index: tripIndex)
                                  .time,
                              type: TripPropertyType.time,
                            ),
                            TripProperty(
                              text: _tripDataController
                                  .getTripItem(index: tripIndex)
                                  .age,
                              type: TripPropertyType.age,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TripProperty(
                              text: _tripDataController
                                  .getTripItem(index: tripIndex)
                                  .distance,
                              type: TripPropertyType.distance,
                            ),
                            TripProperty(
                              text: _tripDataController
                                  .getTripItem(index: tripIndex)
                                  .rating,
                              type: TripPropertyType.rating,
                            ),
                          ],
                        ),
                        SafeArea(
                          top: false,
                          child: Padding(
                            padding: const EdgeInsets.all(Constants.bottomMargin),
                            child: OutlinedButton(
                              child: KompasText(
                                text: "Zaczynamy",
                                style: AppTextStyles.headerH3
                                    .copyWith(color: AppColors.primaryNormal),
                              ),
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.primaryNormal,
                                padding: EdgeInsets.fromLTRB(
                                  Constants.endMargin,
                                  Constants.bottomMargin,
                                  Constants.endMargin,
                                  Constants.bottomMargin,
                                ),
                                backgroundColor: AppColors.primaryWhite,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Constants.borderRadius),
                                ),
                              ),
                              onPressed: () {
                                Get.to(() => TripPage(tripIndex: tripIndex));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Drag handle area (40 px high)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 40,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onVerticalDragUpdate: (details) {
                    if (details.delta.dy > 10) {
                      Get.back(); // Dismiss bottom sheet on downward swipe in handle area
                    }
                  },
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
