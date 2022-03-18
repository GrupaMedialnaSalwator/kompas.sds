import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/kompasText.dart';
import 'package:kompas/statics/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: Constants.buttonMargin);
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
                  const SizedBox(height: Constants.bottomMargin),
                  Image.asset(
                      "assets/images/icons/wsd_logo_white_transparent.png",
                      scale: Constants.drawerLogoScale,
                      fit: BoxFit.fitWidth),
                  const SizedBox(height: Constants.bottomMargin),
                  KompasText(
                      style: AppTextStyles.headerH3White, text: "kompas.sds"),
                  KompasText(
                      style: AppTextStyles.paragraphTextWhite,
                      text: "wersja: 0.0.1 (alpha)"),
                  const SizedBox(height: Constants.bottomMargin),
                  ClipRRect(
                    child: Image.asset("assets/images/gms_team_white.png"),
                    borderRadius: BorderRadius.all(Radius.circular(Constants.borderRadius)),
                  ),
                  const SizedBox(height: Constants.bottomMargin),
                  KompasText(
                      style: AppTextStyles.paragraphTextWhite,
                      textAlign: TextAlign.center,
                      text:
                          "Grupa Medialna Salwator życzy dobrego pobytu w Bagnie!"),
                  const SizedBox(height: Constants.spacerLarge),
                  KompasText(
                      style: AppTextStyles.paragraphTextWhite,
                      textAlign: TextAlign.center,
                      text:
                          "Wyższe Seminarium Duchowne Salwatorianów w Bagnie"),
                  const SizedBox(height: Constants.minMargin),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Constants.insideMargin),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'www.wsd.sds.pl',
                            style: TextStyle(
                                color: AppColors.primaryWhite,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launch('https://wsd.sds.pl/');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(Constants.minMargin),
                  //   child: TextButton(
                  //     child: Text("Oceń nas"),
                  //     style: ButtonStyle(
                  //         shape:
                  //             MaterialStateProperty.all<RoundedRectangleBorder>(
                  //                 RoundedRectangleBorder(
                  //       borderRadius:
                  //           BorderRadius.circular(Constants.borderRadius),
                  //     ))),
                  //     onPressed: () {
                  //       print('will open app rating system in the future here');
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
