import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColors.primaryNormal,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        elevation: 0, // no shadow
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.primaryWhite,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _tripDataController.getTripItem(index: tripIndex).countPoints
                ? Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryNormal
                          .withOpacity(Constants.opacity75),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Constants.borderRadius),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(LineIcons.trophy),
                          Obx(
                            () => Text(
                              ' ' +
                                  _tripStateController
                                      .getCurrentPoints()
                                      .toString(),
                              style: TextStyle(color: AppColors.primaryWhite),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : // Placeholder
                SizedBox(width: Constants.minMargin),
          ],
        ),

        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryNormal.withOpacity(Constants.opacity75),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.close),
                color: AppColors.primaryWhite,
                onPressed: () {
                  _tripStateController
                      .resetState(); // redundant, since controller will be destroyed
                  Get.until((route) => Get.currentRoute == AppRoutes.home);
                },
              ),
            ),
          ),
          // Space from the right side
          SizedBox(
            width: Constants.minMargin,
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
