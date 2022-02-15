import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';
import 'package:gra_terenowa/widgets/cardHeroDisplay_widget.dart';

class CardHero extends StatelessWidget {
  const CardHero(
      {Key? key,
      required this.onTap,
      required this.cardHeight,
      required this.cardWidth,
      required this.tripIndex})
      : super(key: key);

  final VoidCallback onTap;
  final double cardWidth;
  final double cardHeight;
  final int tripIndex;

  @override
  Widget build(BuildContext context) {
    final TripDataController _tripDataController = Get.find();

    return Card(
      elevation: 8,
      color: AppColors.primaryWhite,
      margin: EdgeInsets.all(Constants.cardMargin),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          if (_tripDataController.getTripItem(index: tripIndex).enabled) {
            onTap();
          } else {}
        },
        child: CardHeroDisplay(
          enabled: _tripDataController.getTripItem(index: tripIndex).enabled,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              SizedBox(
                  height: cardHeight,
                  width: cardWidth,
                  child: Hero(
                    tag: tripIndex.toString(),
                    child: Container(
                      child: Image.asset(
                        _tripDataController
                            .getTripItem(index: tripIndex)
                            .imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Positioned(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryNormal
                        .withOpacity(Constants.opacity75),
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 1.5, color: AppColors.primaryWhite),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _tripDataController
                              .getTripItem(index: tripIndex)
                              .time,
                          style: Get.context!.textTheme.headline2
                              ?.copyWith(color: AppColors.primaryWhite),
                        ),
                        Text(
                          "min",
                          style: Get.context!.textTheme.bodyText2
                              ?.copyWith(color: AppColors.primaryWhite),
                        ),
                      ],
                    ),
                  ),
                ),
                top: Constants.cardMargin,
                right: Constants.cardMargin,
              ),
              SizedBox(
                width: cardWidth - Constants.cardMargin - Constants.cardMargin,
                child: ListTile(
                  visualDensity: VisualDensity.comfortable,
                  title: Text(
                    _tripDataController.getTripItem(index: tripIndex).title,
                    style: Get.context!.textTheme.headline3
                        ?.copyWith(color: AppColors.primaryWhite),
                  ),
                  subtitle: Text(
                    _tripDataController.getTripItem(index: tripIndex).subtitle,
                    style: Get.context!.textTheme.headline4
                        ?.copyWith(color: AppColors.primaryWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.borderRadius),
      ),
    );
  }
}
