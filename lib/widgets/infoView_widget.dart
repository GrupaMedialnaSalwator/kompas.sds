import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/widgets/achievementTracker_widget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  title: Text("Najbliższa msza święta",
                      style: TextStyle(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.bold)),
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
                                        Text(
                                          "Kościół Wniebowzięcia NMP na ul. Ziołowej 36 w Bagnie.",
                                          softWrap: true,
                                          maxLines: 2,
                                        ),
                                        SizedBox(height: 10),
                                        Text("Godziny Mszy Świętych:"),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Pn-Pt:"),
                                                Text("Sob:"),
                                                Text("Ndz:")
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("18:00"),
                                                Text("8:00, 18:00"),
                                                Text("8:30, 11:30, 17:30")
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                      "assets/images/icons/kosciol_bagno_circular.png",
                                      scale: 3.5,
                                      fit: BoxFit.fitWidth),
                                  SizedBox(height: 10),
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
                  title: Text("Zakonnicy w klasztorze",
                      style: TextStyle(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("Ilu ich tutaj mieszka?"),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Constants.insideMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Na terenie klasztoru w Bagnie obecnie mieszka:\n"),
                          Text("7 księży"),
                          Text("14 kleryków"),
                          Text("2 siostry zakonne"),
                          Text("5 braci zakonnych"),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ]),
              ExpansionTile(
                  iconColor: AppColors.accentSelect,
                  textColor: AppColors.accentSelect,
                  leading: Icon(LineIcons.binoculars),
                  title: Text("Zwiedzanie klasztoru",
                      style: TextStyle(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("Kiedy i jak?"),
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: Constants.insideMargin),
                        child: Text(
                          "Zapraszamy do zwiedzania wnętrza naszego obiektu w każdą niedzielę o godz. 14.00, 15.00 i 16.00. Wystarczy poprosić o oprowadzanie furtiana, którego można znaleźć w środku przy głównym wejściu.",
                        )),
                    SizedBox(height: 10),
                  ]),
              ExpansionTile(
                  iconColor: AppColors.accentSelect,
                  textColor: AppColors.accentSelect,
                  leading: Icon(LineIcons.hotel),
                  title: Text("Budynek ToTu",
                      style: TextStyle(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.bold)),
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
                    SizedBox(height: 10),
                  ]),
              ExpansionTile(
                  iconColor: AppColors.accentSelect,
                  textColor: AppColors.accentSelect,
                  leading: Icon(LineIcons.utensils),
                  title: Text("Gastronomia i noclegi",
                      style: TextStyle(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("Czy są tutaj oferowane?"),
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Constants.insideMargin),
                      child: Text(
                        "Ze względu na charakter miejsca zasadniczo nie udostępniamy miejsc noclegowych. Nie prowadzimy także usług gastronomicznych.\n\nDziękujemy za zrozumienie.",
                      ),
                    ),
                    SizedBox(height: 10),
                  ]),
              ExpansionTile(
                  iconColor: AppColors.accentSelect,
                  textColor: AppColors.accentSelect,
                  leading: Icon(LineIcons.mobilePhone),
                  title: Text("Twórcy aplikacji",
                      style: TextStyle(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("Kim jesteśmy?"),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Constants.insideMargin),
                      child: Text(
                        "Jesteśmy klerykami serminarium Salwatorianów w Bagnie, którzy są zaangażowani w Grupę Medialną Salwator. Zainteresowanie nowymi technologiami chcemy wykorzystać do ewangelizacji, naśladując zapał apostolski naszego założyciela, bł. Franciszka Marii od Krzyża Jordana.",
                        //TODO: insert GMS group photo here
                      ),
                    ),
                    SizedBox(height: 10),
                  ]),
            ],
          )),
    );
  }
}
