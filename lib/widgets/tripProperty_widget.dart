import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/model/tripDatabase.dart';
import 'package:kompas/statics/text_styles.dart';

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
                style: AppTextStyles.headerH3.copyWith(color: AppColors.primaryWhite),
              ),
              if (type == TripPropertyType.time)
                Text(
                  TripItem.minuteStr,
                  style: AppTextStyles.paragraphText.copyWith(color: AppColors.primaryWhite),
                )
              else if (type == TripPropertyType.distance)
                Text(
                  TripItem.kilometerStr,
                  style: AppTextStyles.paragraphText.copyWith(color: AppColors.primaryWhite),
                )
            ],
          ),
          Text(
            TripItem.getTypeStr(type),
            style: AppTextStyles.paragraphSubtext.copyWith(color: AppColors.primaryWhite),
          ),
        ],
      ),
    );
  }
}
