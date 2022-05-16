import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/kompasText.dart';
import 'package:kompas/statics/text_styles.dart';
import 'package:kompas/view/about_screen.dart';
import 'package:url_launcher/url_launcher.dart';


class DrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: Constants.buttonMargin);
  final int yearToday = DateTime.now().year;
  final ScrollController _scrollController =
      ScrollController(keepScrollOffset: false);

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
                style: AppTextStyles.headerH5
                    .copyWith(color: AppColors.primaryWhite),
              ),
              accountEmail: Text(
                "przewodnik po klasztorze",
                style: AppTextStyles.paragraphSubtext
                    .copyWith(color: AppColors.primaryWhite),
              ),
              currentAccountPicture: CircleAvatar(
                child: Image.asset(
                    'assets/images/icons/wsd_logo_white_transparent.png'),
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
                style: AppTextStyles.headerH6
                    .copyWith(color: AppColors.primaryWhite),
              ),
              onTap: () {
                print('dialog');
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
                            style: AppTextStyles.headerH6
                                .copyWith(color: AppColors.primaryDark),
                          ),
                          Text(
                            "Jak chcesz nas ocenić?",
                            style: AppTextStyles.paragraphSubtext
                                .copyWith(color: AppColors.primaryDark),
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
                              style: AppTextStyles.headerH6
                                  .copyWith(color: AppColors.primaryWhite),
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
                      const SizedBox(height: Constants.cardMargin),
                      OutlinedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.mail_rounded),
                            Spacer(flex: 1),
                            KompasText(
                              text: "Prywatnie",
                              style: AppTextStyles.headerH6
                                  .copyWith(color: AppColors.primaryWhite),
                            ),
                            Spacer(flex: 1),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          primary: AppColors.primaryWhite,
                          backgroundColor: AppColors.primaryNormal,
                        ),
                        onPressed: () {
                          launch('https://kompas.sds.pl/#kontakt')
                              .whenComplete(() => Get.back());
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
                              style: AppTextStyles.headerH6
                                  .copyWith(color: AppColors.primaryWhite),
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
                  ),
                );
              },
            ),

            ListTile(
              iconColor: AppColors.primaryWhite,
              leading: Icon(Icons.person_outline),
              title: Text(
                "O nas",
                style: AppTextStyles.headerH6
                    .copyWith(color: AppColors.primaryWhite),
              ),
              onTap: () {
                launch('https://wsd.sds.pl');
              },
            ),

            ListTile(
              iconColor: AppColors.primaryWhite,
              leading: Icon(Icons.alternate_email_rounded),
              title: Text(
                "Kontakt",
                style: AppTextStyles.headerH6
                    .copyWith(color: AppColors.primaryWhite),
              ),
              onTap: () {},
            ),
            ListTile(
              iconColor: AppColors.primaryWhite,
              leading: Icon(Icons.grid_3x3_outlined),
              title: Text(
                "Prywatność",
                style: AppTextStyles.headerH6
                    .copyWith(color: AppColors.primaryWhite),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                      backgroundColor: AppColors.primaryWhite,
                      contentPadding: EdgeInsets.all(Constants.bottomMargin),
                      title: Center(
                        child: Column(
                          children: [
                            Text(
                              "Regulamin i polityka prywatności",
                              style: AppTextStyles.headerH5
                                  .copyWith(color: AppColors.primaryDark),
                            ),
                            SizedBox(height: Constants.bottomMargin)
                            // Text(
                            //   "Jak chcesz nas ocenić?",
                            //   style: AppTextStyles.paragraphSubtext
                            //       .copyWith(color: AppColors.primaryDark),
                            // ),
                          ],
                        ),
                      ),
                      children: [
                        Text(
                          "Kim jesteśmy?\n",
                          style: AppTextStyles.headerH6,
                        ),
                        Text(
                            "Jesteśmy Salwatorianami\n\nW ramach Wyższego Seminarium Duchownego Salwatorianów w Bagnie działa amatorska Grupa Medialna Salwator, która składa się z kleryków i księdza opiekuna. Zainspirowani charyzmatem naszego założyciela, bł. Franciszka Jordana, chcemy głosić Ewangelię wszelkimi możliwymi sposobami.\n\n„Kompas.sds” jest naszą pierwszą próbą stworzenia aplikacji na telefon o charakterze salwatoriańskim. Mamy nadzieję, że się państwu spodoba."),
                        Text(
                          "\nNie zbieramy żadnych danych osobowych\n",
                          style: AppTextStyles.headerH6,
                        ),
                        Text(
                            "Wiemy, że w dzisiejszym świecie celem wielu aplikacji telefonicznych jest zbieranie jak największej ilości danych o użytkownikach. To nie jest naszym celem.\n\nNie zbieramy żadnych danych osobowych w ramach aplikacji „kompas.sds”. Do funkcjonowania aplikacji nie jest potrzebny dostęp do Internetu (można włączyć tryb samolotowy) i nie jest używana lokalizacja GPS.\n\nPomimo tego zastrzerzenia platformy Google Play oraz Apple Store zbierają informacje o użytkownikach aplikacji udostępnianych przez ich platformy i oni są administratorami tych danych (np. ile osób pobrało aplikacje, jakich używają telefonów, oceny, komentarze, etc.)."),
                        Text(
                          "\nPrawa Użytkownika\n",
                          style: AppTextStyles.headerH6,
                        ),
                        Text(
                            "Nasza aplikacja „kompas.sds” jest tworzona na licencji publicznej. Kod jest otwarty i dostępny na platformie:\nhttps://github.com/GrupaMedialnaSalwator/kompas.sds\n\nTreść prawnej licencji ogranicza naszą odpowiedzialność za funkcjonalność aplikacji i nie daje żadnych gwarancji."),
                        Text(
                          "\nMIT License\n",
                          style: AppTextStyles.headerH6,
                        ),
                        Text(
                            "Copyright (c) 2022 GrupaMedialnaSalwator\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the „Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED „AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."),
                        const SizedBox(height: Constants.cardMargin),
                      ]),
                );
                //launch('https://kompas.sds.pl/polityka-prywatnosci');
              },
            ),
            ListTile(
              iconColor: AppColors.primaryWhite,
              leading: Icon(Icons.phone_android_rounded),
              title: Text(
                "O aplikacji",
                style: AppTextStyles.headerH6
                    .copyWith(color: AppColors.primaryWhite),
              ),
              onTap: () {
                Get.to(() => FirstPage(title: 
                'O aplikacji',
                content: Center(child: Text('adasdas'),),
                ));
                // Get.to(() => CustomDialogBox(
                //   title: "Custom Dialog Demo",
                //       descriptions:
                //           "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                //       text: "Yes",

                //     ));
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
