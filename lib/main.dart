import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/extras/routes.dart';
import 'package:gra_terenowa/extras/text_styles.dart';
import 'package:gra_terenowa/views/home_screen.dart';
import 'package:gra_terenowa/views/select_screen.dart';

import 'extras/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GraTerenowa',
      theme: ThemeData.light().copyWith(
        // This is the theme of my application.
        primaryColor: AppColors.primaryNormal,
        backgroundColor: AppColors.primaryWhite,
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
        GetPage(name: AppRoutes.select, page: () => SelectPage()),
      ],
    );
  }
}
