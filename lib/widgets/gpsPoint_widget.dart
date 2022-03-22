// TODO: GPS
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kompas/controller/mapData_controller.dart';
// import 'package:kompas/model/mapDatabase.dart';
// import 'package:kompas/statics/colors.dart';

// class GPSPoint extends StatelessWidget {
//   GPSPoint({
//     Key? key,
//     required this.mapDataController,
//   }) : super(key: key);

//   final MapDataController mapDataController;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Positioned(
//           // changes position based on GPS data
//           left: 900,
//           top: 900,
//           child: Card(
//             elevation: 16,
//             child: InkWell(
//               child: Icon(
//                 MapItem.getTypeIcon(MapItemType.pin),
//                 size: 36,
//                 color: AppColors.accentRed,
//               ),
//               onTap: () {},
//             ),
//             color: AppColors.primaryWhite,
//           ),
//         ));
//   }
// }
