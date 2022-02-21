import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/model/tripDatabase.dart';
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
    return Container(
      // bottomsheet starts 60% lower because it is without an image at the top
      height:
          Get.height * Constants.tripBottomSheetRatio + Constants.borderRadius,
      child: _cardStack(_tripDataController, tripIndex, 0),
    );
  }
}

Stack _cardStack(
    TripDataController tripController, int tripIndex, double topStart) {
  return Stack(
    fit: StackFit.expand,
    alignment: AlignmentDirectional.topCenter,
    children: [
      Positioned(
        top: topStart,
        child: Container(
          width: Get.width,
          height: Get.height * Constants.tripBottomSheetRatio +
              Constants.borderRadius,
          decoration: BoxDecoration(
            color: AppColors.primaryNormal,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(Constants.borderRadius),
              bottom: Radius.zero,
            ),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(
                Constants.borderRadius, 0, Constants.borderRadius, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Constants.cardMargin),
                      child: Center(
                        child: Icon(
                          Icons.maximize_rounded,
                          color: AppColors.primaryWhite,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        tripController.getTripItem(index: tripIndex).title,
                        style: Get.context!.textTheme.headline3
                            ?.copyWith(color: AppColors.primaryWhite),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        tripController
                            .getTripItem(index: tripIndex)
                            .description,
                        style: Get.context!.textTheme.bodyText1
                            ?.copyWith(color: AppColors.primaryWhite),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: TripProperty(
                        text: tripController.getTripItem(index: tripIndex).time,
                        type: TripPropertyType.time,
                      ),
                    ),
                    Center(
                      child: TripProperty(
                        text: tripController.getTripItem(index: tripIndex).age,
                        type: TripPropertyType.age,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: TripProperty(
                        text: tripController
                            .getTripItem(index: tripIndex)
                            .distance,
                        type: TripPropertyType.distance,
                      ),
                    ),
                    Center(
                      child: TripProperty(
                        text:
                            tripController.getTripItem(index: tripIndex).rating,
                        type: TripPropertyType.rating,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(Constants.bottomMargin),
                  child: TextButton(
                    child: Text("Zaczynamy"),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Constants.borderRadius),
                    ))),
                    onPressed: () {
                      print("screen width: " + Get.width.toString());
                      Get.to(() => TripPage(
                            tripIndex: tripIndex,
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
