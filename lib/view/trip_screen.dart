import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/routes.dart';
import 'package:gra_terenowa/extras/constants.dart';
import 'package:gra_terenowa/widgets/tripViewStep_widget.dart';

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
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor:
            AppColors.primaryNormal.withOpacity(Constants.opacity25),
        foregroundColor: AppColors.primaryWhite,
        automaticallyImplyLeading: false,
        title: Text(
          _tripDataController.getTripItem(index: tripIndex).title,
          style: TextStyle(color: AppColors.primaryWhite),
        ),
        elevation: 1,
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
      extendBodyBehindAppBar: true,
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