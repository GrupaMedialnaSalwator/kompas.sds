import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/text_styles.dart';
import 'package:kompas/widgets/cardHeroDisplay_widget.dart';

class CardHero extends StatelessWidget {
  const CardHero(
      {Key? key, required this.onTap, required this.cardHeight, required this.cardWidth, required this.tripIndex})
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
          } else {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Ta przygoda jest na razie niedostępna...',
                  style: TextStyle(color: AppColors.primaryWhite),
                ),
                backgroundColor: AppColors.primaryNormal,
                behavior: SnackBarBehavior.fixed,
                duration: Duration(seconds: Constants.snackBarDuration),
              ),
            );
          }
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
                        _tripDataController.getTripItem(index: tripIndex).imageAsset,
                        fit: BoxFit.cover,
                        gaplessPlayback: true, // prevents flicker on switching images
                      ),
                    ),
                  )),
              Positioned(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryNormal.withOpacity(Constants.opacity75),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: AppColors.primaryWhite),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _tripDataController.getTripItem(index: tripIndex).time,
                          style: AppTextStyles.headerH2.copyWith(color: AppColors.primaryWhite),
                        ),
                        Text(
                          "min",
                          style: AppTextStyles.paragraphSubtext.copyWith(color: AppColors.primaryWhite),
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
                    style: AppTextStyles.headerH3.copyWith(color: AppColors.primaryWhite),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                  subtitle: Text(
                    _tripDataController.getTripItem(index: tripIndex).subtitle,
                    style: AppTextStyles.headerH4.copyWith(color: AppColors.primaryWhite),
                    overflow: TextOverflow.fade,
                    softWrap: false,
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
