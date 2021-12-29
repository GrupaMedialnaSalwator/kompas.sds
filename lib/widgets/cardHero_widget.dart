import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/trip_db_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/statics.dart';

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
    final TripDBController _tripController = Get.find();

    return Card(
      elevation: 8,
      color: AppColors.primaryWhite,
      margin: EdgeInsets.all(Statics.cardMargin),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          onTap();
        },
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
                      _tripController.getTripItem(index: tripIndex).imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Positioned(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryNormal.withOpacity(Statics.opacity75),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: AppColors.primaryWhite),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _tripController.getTripItem(index: tripIndex).time,
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
              top: Statics.cardMargin,
              right: Statics.cardMargin,
            ),
            SizedBox(
              width: cardWidth - Statics.cardMargin - Statics.cardMargin,
              child: ListTile(
                visualDensity: VisualDensity.comfortable,
                title: Text(
                  _tripController.getTripItem(index: tripIndex).title,
                  style: Get.context!.textTheme.headline3
                      ?.copyWith(color: AppColors.primaryWhite),
                ),
                subtitle: Text(
                  _tripController.getTripItem(index: tripIndex).subtitle,
                  style: Get.context!.textTheme.headline4
                      ?.copyWith(color: AppColors.primaryWhite),
                ),
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Statics.borderRadius),
      ),
    );
  }
}
