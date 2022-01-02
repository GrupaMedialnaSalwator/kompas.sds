import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/routes.dart';
import 'package:gra_terenowa/statics/constants.dart';
import 'package:gra_terenowa/widgets/tripViewStep_widget.dart';
import 'package:line_icons/line_icons.dart';

class TripPage extends StatelessWidget {
  const TripPage({
    Key? key,
    required this.tripIndex,
  }) : super(key: key);

  final int tripIndex;

  @override
  Widget build(BuildContext context) {
    final TripDataController _tripDataController = Get.find();
    final TripStateController _tripStateController =
        Get.put(TripStateController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        elevation: 1,
        backgroundColor:
            AppColors.primaryNormal.withOpacity(Constants.opacity25),
        foregroundColor: AppColors.primaryWhite,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _tripDataController.getTripItem(index: tripIndex).title,
              style: TextStyle(color: AppColors.primaryWhite),
            ),
            Row(children: [
              const Icon(LineIcons.trophy),
              Obx(
                () => Text(
                  ' ' + _tripStateController.getCurrentPoints().toString(),
                  style: TextStyle(color: AppColors.primaryWhite),
                ),
              ),
            ]),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            color: AppColors.primaryWhite,
            onPressed: () {
              _tripStateController
                  .resetState(); // redundant, since controller will be destroyed
              Get.until((route) => Get.currentRoute == AppRoutes.home);
            },
          )
        ],
      ),
      body: Obx(
        () => TripViewStep(
          tripStateController: _tripStateController,
          tripDataController: _tripDataController,
          tripDataSelect: TripDataSelect(
              tripIndex: tripIndex,
              stepIndex: _tripStateController.getCurrentStep()),
        ),
      ),
    );
  }
}
