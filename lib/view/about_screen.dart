import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title, required this.content})
      : super(key: key);
  final String title;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColors.primaryNormal,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        iconTheme: IconThemeData(color: AppColors.primaryNormal),
        backgroundColor:
            AppColors.primaryWhite.withOpacity(Constants.opacity25),
        foregroundColor: AppColors.primaryWhite,
        elevation: 0,
        title: Text(
          this.title,
          style: TextStyle(color: AppColors.primaryDark),
        ),
      ),
      body: this.content
    );
  }
}
