import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/controller/tripState_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/view/selectTrip_screen.dart';
import 'package:kompas/widgets/selectTrip_widget.dart';

import 'cardHero_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TripStateController _tripStateController = Get.find();
    final TripDataController _tripDataController = Get.find();

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 36)),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(36, 36, 0, 16),
            child: Text(
              "Zapraszamy",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(36, 0, 0, 4),
            child: Text(
              "do przygody",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(36, 0, 0, 18),
            child: Text(
              "w naszym klasztorze",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Container(
            height: Get.height * Constants.cardHeightRatio,
            child: ListView.separated(
              padding: EdgeInsets.all(20),
              itemCount: _tripDataController.getTripsLength(),
              separatorBuilder: (BuildContext context, int index) =>
                  VerticalDivider(width: 20, color: AppColors.primaryWhite),
              itemBuilder: (BuildContext context, int index) {
                return CardHero(
                  cardHeight: Get.height * Constants.cardHeightRatio,
                  cardWidth: Get.width * Constants.cardWidthRatio,
                  tripIndex: index,
                  onTap: () {
                    _tripStateController.resetState();
                    Get.to(() => SelectTripPage(
                          tripIndex: index,
                        ));
                    Get.bottomSheet(
                      SelectTrip(
                        tripIndex: index,
                        onTapButton: () {},
                      ),
                      isScrollControlled: true,
                      barrierColor: AppColors.transparent,
                    ).whenComplete(() => Get.back());
                  },
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
