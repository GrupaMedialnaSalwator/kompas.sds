import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';
import 'package:gra_terenowa/view/selectTrip_screen.dart';
import 'package:gra_terenowa/widgets/selectTrip_widget.dart';

import 'cardHero_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 36)),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(36, 36, 0, 16),
            child: Text(
              "Zapraszamy",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(36, 0, 0, 4),
            child: Text(
              "do przygody",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(36, 0, 0, 18),
            child: Text(
              "w naszym klasztorze",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            height: Get.height * Constants.cardHeightRatio,
            child: ListView.separated(
              padding: EdgeInsets.all(20),
              itemCount: 3, // TODO: generate number of trips programatically
              separatorBuilder: (BuildContext context, int index) =>
                  VerticalDivider(width: 20, color: AppColors.primaryWhite),
              itemBuilder: (BuildContext context, int index) {
                return CardHero(
                  cardHeight: Get.height * Constants.cardHeightRatio,
                  cardWidth: Get.width * Constants.cardWidthRatio,
                  tripIndex: index,
                  onTap: () {
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
