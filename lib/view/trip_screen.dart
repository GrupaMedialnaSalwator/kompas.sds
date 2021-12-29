import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/app_controller.dart';
import 'package:gra_terenowa/controller/tripTab_controller.dart';
import 'package:gra_terenowa/controller/trip_db_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/routes.dart';
import 'package:gra_terenowa/extras/statics.dart';
import 'package:gra_terenowa/widgets/tripStepView_widget.dart';

class TripPage extends StatelessWidget {
  const TripPage({
    Key? key,
    required this.tripIndex,
  }) : super(key: key);

  final int tripIndex;

  @override
  Widget build(BuildContext context) {
    final TripDBController _tripController = Get.find();
    final AppController _appController = Get.find();
    TripTabController _tabController = Get.put(TripTabController(
        tripIndex: tripIndex,
        initLength: _tripController.getStepsLength(
            tripIndex: tripIndex,
            runIndex: _appController.getCurrentRun().value)));

    return SafeArea(
      child: Obx(
        () => DefaultTabController(
          length: _tripController.getStepsLength(
              tripIndex: tripIndex,
              runIndex: _appController.getCurrentRun().value),
          child: Scaffold(
            backgroundColor: AppColors.primaryWhite,
            appBar: AppBar(
              backgroundColor:
                  AppColors.primaryNormal.withOpacity(Statics.opacity25),
              foregroundColor: AppColors.primaryWhite,
              automaticallyImplyLeading: false,
              title: Text(
                _tripController.getTripItem(index: tripIndex).title,
                style: TextStyle(color: AppColors.primaryWhite),
              ),
              elevation: 1,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.close),
                  color: AppColors.primaryWhite,
                  onPressed: () {
                    _appController.resetCurrentRun();
                    Get.until((route) => Get.currentRoute == AppRoutes.home);
                  },
                )
              ],
            ),
            extendBodyBehindAppBar: true,
            body: Obx(
              () => TabBarView(
                controller: _tabController.controller,
                children: List<Widget>.generate(
                    _tripController.getStepsLength(
                        tripIndex: tripIndex,
                        runIndex: _appController.getCurrentRun().value),
                    (int index) {
                  return TripStepView(
                    tripController: _tripController,
                    tripSelect: TripSelect(
                        tripIndex: tripIndex,
                        runIndex: _appController.getCurrentRun().value,
                        stepIndex: index),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
