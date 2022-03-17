import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/statics/routes.dart';
import 'package:kompas/statics/text_styles.dart';
import 'package:kompas/view/home_screen.dart';
import 'package:kompas/view/mapCard_screen.dart';
import 'package:kompas/view/trip_screen.dart';

import 'statics/colors.dart';
import 'view/selectTrip_screen.dart';
/* TODO: turn firebase back on once needed import 'services/firebase_options.dart';
import 'services/firebase_helper.dart'; //TODO: remove this test-purposes import in the future
import 'package:firebase_core/firebase_core.dart';*/
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  /* TODO: turn firebase back on once needed 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'kompas.sds',
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.primaryNormal,
        backgroundColor: AppColors.primaryWhite,
        highlightColor: AppColors.primaryNormal, //color for scrollbar
        colorScheme: ColorScheme.fromSwatch(
          accentColor: AppColors
              .primaryLight, // color for overscroll glow effect in ListView
        ),
        textTheme: const TextTheme(
          headline1: AppTextStyles.headerH1,
          headline2: AppTextStyles.headerH2,
          headline3: AppTextStyles.headerH3,
          headline4: AppTextStyles.headerH4,
          headline5: AppTextStyles.headerH5,
          bodyText1: AppTextStyles.paragraphText,
          bodyText2: AppTextStyles.paragraphSubtext,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: AppColors.primaryNormal,
            onSurface: AppColors.primaryGray,
            backgroundColor: AppColors.primaryWhite,
            textStyle: AppTextStyles.headerH3,
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 72,
            ),
          ),
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: [
        GetPage(name: AppRoutes.home, page: () => HomePage()),
        GetPage(
            name: AppRoutes.selectTrip,
            page: () => SelectTripPage(tripIndex: 0)),
        GetPage(name: AppRoutes.trip, page: () => TripPage(tripIndex: 0)),
        GetPage(
            name: AppRoutes.mapCard, page: () => MapCardPage(mapItemIndex: 0)),
      ],
    );
  }
}
