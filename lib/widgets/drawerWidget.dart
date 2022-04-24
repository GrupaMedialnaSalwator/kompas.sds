import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: Constants.buttonMargin);
  final int yearToday = DateTime.now().year;
  final ScrollController _scrollController = ScrollController(keepScrollOffset: false);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryNormal,
      child: Scrollbar(
        isAlwaysShown: true,
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
                print('dialog');
                Get.defaultDialog(
                  title: 'Dziękujemy',
                  titleStyle: AppTextStyles.headerH6,
                  middleText: 'Jak chcesz nas ocenić?',
                  middleTextStyle: AppTextStyles.paragraphSubtext,
                  radius: 8,
                  backgroundColor: AppColors.primaryWhite,
                  actions: [
                    OutlinedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Spacer(flex: 1),
                          Text(
                            "Publicznie",
                            style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: AppColors.primaryWhite,
                        backgroundColor: AppColors.primaryNormal,
                      ),
                      onPressed: () {
                        launch('https://play.google.com/store/apps/details?id=pl.sds.kompas')
                            .whenComplete(() => Get.back());
                      },
                    ),
                    OutlinedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.mail_rounded),
                          Spacer(flex: 1),
                          Text(
                            "Prywatnie",
                            style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: AppColors.primaryWhite,
                        backgroundColor: AppColors.primaryNormal,
                      ),
                      onPressed: () {
                        launch('https://kompas.sds.pl/#kontakt').whenComplete(() => Get.back());
                      },
                    ),
                    OutlinedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.cancel_rounded),
                          Spacer(flex: 1),
                          Text(
                            "Nie teraz",
                            style: AppTextStyles.headerH6.copyWith(color: AppColors.primaryWhite),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        primary: AppColors.primaryWhite,
                        backgroundColor: AppColors.primaryNormal,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                );
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
                launch('https://kompas.sds.pl');
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
                launch('https://wsd.sds.pl');
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
                launch('https://kompas.sds.pl/polityka-prywatnosci');
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
                launch('https://kompas.sds.pl/#kontakt');
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
