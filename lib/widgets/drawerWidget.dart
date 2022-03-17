import 'package:flutter/material.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/kompasText.dart';
import 'package:kompas/statics/text_styles.dart';

class DrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppColors.primaryNormal,
        child: ListView(
          children: <Widget>[
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Image.asset(
                      "assets/images/icons/wsd_logo_white_transparent.png",
                      scale: 7,
                      fit: BoxFit.fitWidth),
                  const SizedBox(height: 24),
                  KompasText(
                      style: AppTextStyles.headerH3White, text: "kompas.sds"),
                  KompasText(
                      style: AppTextStyles.paragraphTextWhite,
                      text: "wersja: 0.0.1 (alpha)"),
                  const SizedBox(height: 24),
                  Image.asset("assets/images/gms_team.png",
                      scale: 2, fit: BoxFit.fitWidth),
                  const SizedBox(height: 24),
                  KompasText(
                      style: AppTextStyles.paragraphTextWhite,
                      text:
                          "Grupa Medialna Salwator życzy udanego pobytu w Bagnie!"),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(Constants.minMargin),
                    child: TextButton(
                      child: Text("Oceń nas"),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Constants.borderRadius),
                      ))),
                      onPressed: () {
                        print('will open app rating system in the future here');
                      },
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
        
      ),
    );
  }


}
