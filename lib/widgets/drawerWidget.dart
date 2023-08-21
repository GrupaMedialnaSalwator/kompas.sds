import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/kompasText.dart';
import 'package:kompas/statics/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: Constants.buttonMargin);
  final int yearToday = DateTime.now().year;
  final ScrollController _scrollController = ScrollController(keepScrollOffset: false);

  final Uri _urlGoogleStore = Uri.parse('https://play.google.com/store/apps/details?id=pl.sds.kompas');
  final Uri _urlKontakt = Uri.parse('https://kompas.sds.pl/#kontakt');
  final Uri _urlWSD = Uri.parse('https://wsd.sds.pl');
  final Uri _urlPrivacy = Uri.parse('https://kompas.sds.pl/polityka-prywatnosci');
  final Uri _urlKompas = Uri.parse('https://kompas.sds.pl');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryNormal,
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "kompas.sds",
                style: AppTextStyles.headerH5.copyWith(color: AppColors.primaryWhite),
              ),
              accountEmail: Text(
                "przewodnik po klasztorze",
                style: AppTextStyles.paragraphSubtext.copyWith(color: AppColors.primaryWhite),
              ),
              currentAccountPicture: CircleAvatar(
                child: Image.asset('assets/images/icons/wsd_logo_white_transparent.png'),
                backgroundColor: AppColors.primaryNormal,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/trip_01.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: Constants.bottomMargin),
            ListTile(
              iconColor: Colors.yellow,
              leading: Icon(Icons.star),
              title: Text(
                "Oceń nas",
                style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
              ),
              onTap: () {
                //print('dialog');
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    backgroundColor: AppColors.primaryWhite,
                    contentPadding: EdgeInsets.all(Constants.bottomMargin),
                    title: Center(
                      child: Column(
                        children: [
                          Text(
                            "Dziękujemy",
                            style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryDark),
                          ),
                          Text(
                            "Jak chcesz nas ocenić?",
                            style: AppTextStyles.paragraphSubtext.copyWith(color: AppColors.primaryDark),
                          ),
                        ],
                      ),
                    ),
                    children: [
                      OutlinedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Spacer(flex: 1),
                            KompasText(
                              text: "Publicznie",
                              style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
                            ),
                            Spacer(flex: 1),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryWhite,
                          backgroundColor: AppColors.primaryNormal,
                        ),
                        onPressed: () {
                          launchUrl(mode: LaunchMode.externalApplication, _urlGoogleStore)
                              .whenComplete(() => Get.back());
                        },
                      ),
                      const SizedBox(height: Constants.cardMargin),
                      OutlinedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.mail_rounded),
                            Spacer(flex: 1),
                            KompasText(
                              text: "Prywatnie",
                              style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
                            ),
                            Spacer(flex: 1),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryWhite,
                          backgroundColor: AppColors.primaryNormal,
                        ),
                        onPressed: () {
                          launchUrl(mode: LaunchMode.externalApplication, _urlKontakt).whenComplete(() => Get.back());
                        },
                      ),
                      const SizedBox(height: Constants.cardMargin),
                      OutlinedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.cancel_rounded),
                            Spacer(flex: 1),
                            KompasText(
                              text: "Nie teraz",
                              style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
                            ),
                            Spacer(flex: 1),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryWhite,
                          backgroundColor: AppColors.primaryNormal,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),

            ListTile(
              iconColor: AppColors.primaryWhite,
              leading: Icon(Icons.person_outline),
              title: Text(
                "O nas",
                style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
              ),
              onTap: () {
                launchUrl(mode: LaunchMode.externalApplication, _urlWSD);
              },
            ),

            ListTile(
              iconColor: AppColors.primaryWhite,
              leading: Icon(Icons.alternate_email_rounded),
              title: Text(
                "Kontakt",
                style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
              ),
              onTap: () {
                launchUrl(mode: LaunchMode.externalApplication, _urlWSD);
              },
            ),
            ListTile(
              iconColor: AppColors.primaryWhite,
              leading: Icon(Icons.grid_3x3_outlined),
              title: Text(
                "Prywatność",
                style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
              ),
              onTap: () {
                launchUrl(mode: LaunchMode.externalApplication, _urlPrivacy);
              },
            ),
            ListTile(
              iconColor: AppColors.primaryWhite,
              leading: Icon(Icons.phone_android_rounded),
              title: Text(
                "O aplikacji",
                style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
              ),
              onTap: () {
                launchUrl(mode: LaunchMode.externalApplication, _urlKompas);
              },
            ),
            const SizedBox(height: Constants.bottomMargin),
            // KompasText(
            //     style: AppTextStyles.paragraphSubtext.copyWith(color: AppColors.primaryWhite),
            //     textAlign: TextAlign.center,
            //     text: "© $yearToday Wyższe Seminarium Duchowne Salwatorianów w Bagnie"),
            // const SizedBox(height: Constants.bottomMargin),
          ],
        ),
      ),
    );
  }
}
