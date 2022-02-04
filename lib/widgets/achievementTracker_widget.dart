import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:hive/hive.dart';

// class AchievementTracker extends StatelessWidget {
//   const AchievementTracker({
//     Key? key,
//     required this.tripScore,
//     required this.answerScore,
//   }) : super(key: key);

//   final int tripScore;
//   final int answerScore;

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTileCard(
//       baseColor: AppColors.primaryWhite,
//       expandedColor: AppColors.primaryWhite,
//       leading: Image.asset("assets/images/icons/winner_cup.png", scale: 5),
//       title: Text("Osiągnięcia",
//           style: TextStyle(
//               color: AppColors.primaryNormal, fontWeight: FontWeight.bold)),
//       subtitle: Text(
//           "Sprawdź ile zdobyłeś punktów za dobre odpowiedzi w przygodach.",
//           style: TextStyle(color: AppColors.primaryDark)),
//       children: <Widget>[
//         Divider(
//           thickness: 1.0,
//           height: 1.0,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 16.0,
//               vertical: 8.0,
//             ),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Punkty za dobre odpowiedzi: $answerScore",
//                     //MK TODO: add badges for completing trips
//                     style: Theme.of(context).textTheme.headline5,
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Punkty za ukończone przygody: $tripScore",
//                     //MK TODO: add badges for completing trips
//                     style: Theme.of(context).textTheme.headline5,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class AchievementOperations {
  AchievementOperations();

  void incrementTripScore(TripDataSelect tripDataSelect) async {
    Box tripScoreBox = await Hive.openBox('TripScore');
    tripScoreBox.put(tripDataSelect.tripIndex, 1);
  }

  void incrementAnswerScore(TripDataSelect tripDataSelect) async {
    Box answerScoreBox = await Hive.openBox('AnswerScore');
    print(
        "BOX NAME IS ${tripDataSelect.tripIndex}_${tripDataSelect.stepIndex}");
    answerScoreBox.put(
        "${tripDataSelect.tripIndex}_${tripDataSelect.stepIndex}", 1);
  }

  Future<int> readTripScore() async {
    Box tripScoreBox = await Hive.openBox('TripScore');
    return tripScoreBox.length;
  }

  Future<int> readAnswerScore() async {
    Box answerScoreBox = await Hive.openBox('AnswerScore');
    return answerScoreBox.length;
  }

  Future returnTripScore() async {
    int tripScoreint = await readTripScore();
    return tripScoreint;
  }
}
