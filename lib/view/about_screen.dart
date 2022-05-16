import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title, required this.content})
      : super(key: key);
  final String title;
  final List<Widget> content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: AppColors.primaryWhite,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: AppColors.primaryNormal,
            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
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
        body: Container(
            margin: EdgeInsets.all(Constants.insideMargin),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_compass_v3.jpg"),
                //colorFilter: ColorFilter.mode(Colors.white.withOpacity(1.0), BlendMode.modulate),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: 
                  // SizedBox(
                  //   height: AppBar().preferredSize.height,
                  // ),
                  this.content
                ))));
  }
}
