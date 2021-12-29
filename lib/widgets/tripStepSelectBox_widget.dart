import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/app_controller.dart';
import 'package:gra_terenowa/controller/tripTab_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/statics.dart';

class TripStepSelectBox extends StatelessWidget {
  const TripStepSelectBox({
    Key? key,
    required this.selectionNum,
    required this.text,
    required this.boxColor,
  }) : super(key: key);

  final int selectionNum;
  final String text;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    final AppController _appController = Get.find();
    final TripTabController _tabController = Get.find();
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Statics.borderRadius),
          color: boxColor,
        ),
        child: Center(
          child: Text(
            text,
            style: Get.context!.textTheme.headline3
                ?.copyWith(color: AppColors.primaryDark),
          ),
        ),
      ),
      onTap: () {
        // 1. set current answer and increment run count
        // TODO: fix flickering bug - resetIndex and incrementCurrentRun are not instantenous
        _appController.setCurrentAnswer(selectionNum);
        _appController.incrementCurrentRun();
        // 2. load new views - automatically Obx()
        // 3. go to step 0 of the next run and pass the tapped box number - automatically by changine controller.index
        _tabController.resetIndex();
      },
    );
  }
}
