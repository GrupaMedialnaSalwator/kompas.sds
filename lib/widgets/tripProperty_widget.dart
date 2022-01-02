import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/model/database.dart';

class TripProperty extends StatelessWidget {
  const TripProperty({
    Key? key,
    required this.type,
    required this.text,
  }) : super(key: key);

  final TripPropertyType type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                text,
                style: Get.context!.textTheme.headline3
                    ?.copyWith(color: AppColors.primaryWhite),
              ),
              if (type == TripPropertyType.time)
                Text(
                  TripItem.minuteStr,
                  style: Get.context!.textTheme.bodyText1
                      ?.copyWith(color: AppColors.primaryWhite),
                )
              else if (type == TripPropertyType.distance)
                Text(
                  TripItem.kilometerStr,
                  style: Get.context!.textTheme.bodyText1
                      ?.copyWith(color: AppColors.primaryWhite),
                )
            ],
          ),
          Text(
            TripItem.getTypeStr(type),
            style: Get.context!.textTheme.bodyText2
                ?.copyWith(color: AppColors.primaryWhite),
          ),
        ],
      ),
    );
  }
}
