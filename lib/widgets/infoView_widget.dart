import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/widgets/achievementTracker_widget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../statics/kompasText.dart';

class InfoView extends StatelessWidget {
  const InfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //super.build(context); // need to call super method.
    //return Center(child: Text("This tab shows Info View"));
    return Container(
      margin: EdgeInsets.all(Constants.insideMargin),
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 36)),
              AchievementTracker(),
              SizedBox(
                height: 25,
              ),
              Container(
                  margin: EdgeInsets.all(Constants.insideMargin),
                  child: Text(
                    "Pytania i odpowiedzi",
                    style: Theme.of(context).textTheme.headline3,
                  )),
              ExpansionTile(
                  iconColor: AppColors.accentSelect,
                  textColor: AppColors.accentSelect,
                  leading: Icon(LineIcons.cross),
                  title: KompasTitleText(
                    text: "Najbliższa msza święta",
                  ),
                  subtitle: Text("Gdzie i w jakich godzinach?"),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Constants.insideMargin),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        KompasBodyText(
                                          text:
                                              "Kościół Wniebowzięcia NMP na ul. Ziołowej 36 w Bagnie.",
                                        ),
                                        SizedBox(height: Constants.cardMargin),
                                        KompasBodyText(
                                            text: "Godziny Mszy Świętych:"),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                KompasBodyText(text: "Pn-Pt:"),
                                                KompasBodyText(text: "Sob:"),
                                                KompasBodyText(text: "Ndz:")
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                KompasBodyText(text: "18:00"),
                                                KompasBodyText(
                                                    text: "8:00, 18:00"),
                                                KompasBodyText(
                                                    text: "8:30, 11:30, 17:30")
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: Constants.cardMargin),
                                        SizedBox(height: Constants.cardMargin),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                      "assets/images/icons/kosciol_bagno_circular.png",
                                      scale: 3.5,
                                      fit: BoxFit.fitWidth),
                                  SizedBox(height: Constants.cardMargin),
                                ],
                              ),
                            ],
                          )),
                    )
                  ]),
              ExpansionTile(
                  iconColor: AppColors.accentSelect,
                  textColor: AppColors.accentSelect,
                  leading: Icon(LineIcons.users),
                  title: KompasTitleText(
                    text: "Zakonnicy w klasztorze",
                  ),
                  subtitle: Text("Ilu ich tutaj mieszka?"),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Constants.insideMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KompasBodyText(
                              text:
                                  "Na terenie klasztoru w Bagnie obecnie mieszka:\n"),
                          KompasBodyText(text: "7 księży"),
                          KompasBodyText(text: "14 kleryków"),
                          KompasBodyText(text: "2 siostry zakonne"),
                          KompasBodyText(text: "5 braci zakonnych"),
                        ],
                      ),
                    ),
                    SizedBox(height: Constants.cardMargin),
                  ]),
              ExpansionTile(
                  iconColor: AppColors.accentSelect,
                  textColor: AppColors.accentSelect,
                  leading: Icon(LineIcons.binoculars),
                  title: KompasTitleText(
                    text: "Zwiedzanie klasztoru",
                  ),
                  subtitle: Text("Kiedy i jak?"),
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: Constants.insideMargin),
                        child: KompasBodyText(
                          text:
                              "Zapraszamy do zwiedzania wnętrza naszego obiektu w każdą niedzielę o godz. 14.00, 15.00 i 16.00. Wystarczy poprosić o oprowadzanie furtiana, którego można znaleźć w środku przy głównym wejściu.",
                        )),
                    SizedBox(height: Constants.cardMargin),
                  ]),
              ExpansionTile(
                  iconColor: AppColors.accentSelect,
                  textColor: AppColors.accentSelect,
                  leading: Icon(LineIcons.hotel),
                  title: KompasTitleText(
                    text: "Budynek ToTu",
                  ),
                  subtitle: Text("Co to jest?"),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Constants.insideMargin),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Dom ToTu to centrum rozwoju duchowego i kulturowego oraz ośrodek dla młodzieży prowadzony pod patronatem Ruchu Młodzieży Salwatoriańskiej i Salwatoriańskiego Ośrodka Powołań.\n\nOdwiedź stronę internetową\n',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            TextSpan(
                              text: 'www.totu.sds.pl',
                              style: Theme.of(context).textTheme.bodyText2,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://totu.sds.pl/');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Constants.cardMargin),
                  ]),
              ExpansionTile(
                  iconColor: AppColors.accentSelect,
                  textColor: AppColors.accentSelect,
                  leading: Icon(LineIcons.utensils),
                  title: KompasTitleText(
                    text: "Gastronomia i noclegi",
                  ),
                  subtitle: Text("Czy są tutaj oferowane?"),
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Constants.insideMargin),
                      child: KompasBodyText(
                        text:
                            "Ze względu na charakter miejsca zasadniczo nie udostępniamy miejsc noclegowych. Nie prowadzimy także usług gastronomicznych.\n\nDziękujemy za zrozumienie.",
                      ),
                    ),
                    SizedBox(height: Constants.cardMargin),
                  ]),
              ExpansionTile(
                  iconColor: AppColors.accentSelect,
                  textColor: AppColors.accentSelect,
                  leading: Icon(LineIcons.mobilePhone),
                  title: KompasTitleText(
                    text: "Twórcy aplikacji",
                  ),
                  subtitle: Text("Kim jesteśmy?"),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Constants.insideMargin),
                      child: KompasBodyText(
                        text:
                            "Jesteśmy klerykami serminarium Salwatorianów w Bagnie, którzy są zaangażowani w Grupę Medialną Salwator. Zainteresowanie nowymi technologiami chcemy wykorzystać do ewangelizacji, naśladując zapał apostolski naszego założyciela, bł. Franciszka Marii od Krzyża Jordana.",
                        //TODO: insert GMS group photo here
                      ),
                    ),
                    SizedBox(height: Constants.cardMargin),
                  ]),
            ],
          )),
    );
  }
}
