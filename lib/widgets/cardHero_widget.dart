import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/trip_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/statics.dart';

class CardHero extends StatelessWidget {
  const CardHero(
      {Key? key,
      required this.onTap,
      this.cardHeight = 200,
      this.cardWidth = 200,
      required this.tripIndex})
      : super(key: key);

  final VoidCallback onTap;
  final double cardWidth;
  final double cardHeight;
  final int tripIndex;

  @override
  Widget build(BuildContext context) {
    final TripController _tripController = Get.find();

    return Card(
      elevation: 8,
      margin: EdgeInsets.all(Statics.cardMargin),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Visibility(
              visible: true,
              child: Container(
                  height: cardHeight - 8,
                  width: cardWidth - 16,
                  padding: EdgeInsets.all(0.0),
                  alignment: Alignment.bottomLeft,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage(_tripController
                  //         .getTripItem(index: tripIndex)
                  //         .imageAsset),
                  //     fit: BoxFit.fitWidth, //DecorationImage
                  //   ),
                  // ), //BoxDecoration
                  child: Hero(
                    tag: tripIndex.toString(),
                    child: Material(
                      child: Image.asset(_tripController
                          .getTripItem(index: tripIndex)
                          .imageAsset),
                    ),
                  )),
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
            ), //Text
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Statics.borderRadius),
      ),
    );
  }
}
