import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/ifdef.dart';
import 'package:gra_terenowa/extras/statics.dart';
import 'package:gra_terenowa/model/database.dart';
import 'package:gra_terenowa/view/trip_screen.dart';
import 'package:gra_terenowa/widgets/tripProperty_widget.dart';

class SelectTrip extends StatelessWidget {
  const SelectTrip(
      {Key? key, required this.onTapButton, required this.tripIndex})
      : super(key: key);

  final VoidCallback onTapButton;
  final int tripIndex;

  @override
  Widget build(BuildContext context) {
    final TripDataController _tripDataController = Get.find();
    if (IfDef.heroAnimation) {
      return SafeArea(
        child: Container(
          // bottomsheet starts 60% lower because it is without an image at the top
          height:
              Get.height * Statics.tripBottomSheetRatio + Statics.borderRadius,
          child: _cardStack(_tripDataController, tripIndex, 0),
        ),
      );
    } else {
      // TODO: remove the undesired option after user testing
      return SafeArea(
        child: Container(
          // bottomsheet has full height, because it includes an image at the top
          height: Get.height,
          child: _cardStack(
              _tripDataController,
              tripIndex,
              Get.height * (1 - Statics.tripBottomSheetRatio) -
                  Statics.borderRadius),
        ),
      );
    }
  }
}

Stack _cardStack(
    TripDataController tripController, int tripIndex, double topStart) {
  return Stack(
    fit: StackFit.expand,
    alignment: AlignmentDirectional.topCenter,
    children: [
      if (IfDef.heroAnimation == false)
        Positioned(
          top: 0,
          child: Image.asset(
            tripController.getTripItem(index: tripIndex).imageAsset,
            width: Get.width,
            height: Get.height * (1 - Statics.tripBottomSheetRatio),
            fit: BoxFit.fitWidth,
          ),
        ),
      Positioned(
        top: topStart,
        child: Container(
          width: Get.width,
          height:
              Get.height * Statics.tripBottomSheetRatio + Statics.borderRadius,
          decoration: BoxDecoration(
            color: AppColors.primaryNormal,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(Statics.borderRadius),
              bottom: Radius.zero,
            ),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(
                Statics.borderRadius, 0, Statics.borderRadius, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Statics.cardMargin),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.chevron_compact_down,
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
                  padding: const EdgeInsets.all(Statics.bottomMargin),
                  child: TextButton(
                    child: Text("Zaczynamy"),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Statics.borderRadius),
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
