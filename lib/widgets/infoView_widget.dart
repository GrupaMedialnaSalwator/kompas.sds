import 'package:flutter/material.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/widgets/achievementTracker_widget.dart';
import 'package:map_launcher/map_launcher.dart';

class InfoView extends StatelessWidget {
  const InfoView({
    Key? key,
  }) : super(key: key);
  Future<void> navigateCoordinates() async {
    await MapLauncher.showMarker(
      mapType: MapType.google,
      coords: Constants.churchCoords,
      title: "Kościół w Bagnie",
      description: "Nawiguję do kościoła w Bagnie",
    );
  }

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
                  title: Text("Gdzie znajdę najbliższą Mszę Świętą?",
                      style: TextStyle(
                          color: AppColors.primaryNormal,
                          fontWeight: FontWeight.bold)),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.only(left: Constants.insideMargin),
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
                                        Text(
                                          "Pn-Pt: 18:00",
                                        ),
                                        Text(
                                          "Sob: 8:00, 18:00",
                                        ),
                                        Text(
                                          "Ndz: 8:30, 11:30, 17:00, 17:30",
                                        ),
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
                              TextButton.icon(
                                  onPressed: () {
                                    navigateCoordinates();
                                  },
                                  icon: Icon(Icons.navigation),
                                  label: Text('Nawiguj',
                                      style: TextStyle(
                                        color: AppColors.primaryNormal,
                                      )))
                            ],
                          )),
                    )
                  ]),
              ExpansionTile(
                  title: Text(
                      "Ilu zakonników mieszka na terenie Klasztoru w Bagnie?",
                      style: TextStyle(
                          color: AppColors.primaryNormal,
                          fontWeight: FontWeight.bold)),
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: Constants.insideMargin),
                        child: Text(
                          "Na terenie Klasztoru w Bagnie mieszka 28 zakonników.",
                        )),
                    SizedBox(height: 10),
                  ]),
              ExpansionTile(
                  title: Text("Czy można zwiedzić wnętrze klasztoru?",
                      style: TextStyle(
                          color: AppColors.primaryNormal,
                          fontWeight: FontWeight.bold)),
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Constants.insideMargin),
                      child: Text(
                          "Tak, zapraszamy do zwiedzania wnętrza naszego obiektu w każdą niedzielę o godz. 14.00, 15.00 i 16.00. Wystarczy poprosić o oprowadzanie furtiana, którego można znaleźć w środku przy głównym wejściu."),
                    ),
                    SizedBox(height: 10),
                  ]),
              ExpansionTile(
                  title: Text("Co mieści się w budynku z napisem \"ToTu\"?",
                      style: TextStyle(
                          color: AppColors.primaryNormal,
                          fontWeight: FontWeight.bold)),
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Constants.insideMargin),
                      child: Text(
                          "Dom ToTu to centrum rozwoju duchowego i kulturowego oraz ośrodek dla młodzieży prowadzony pod patronatem Ruchu Młodzieży Salwatoriańskiej i Salwatoriańskiego Ośrodka Powołań.\n\nOdwiedź stronę internetową\nhttps://totu.sds.pl/."),
                    ),
                    SizedBox(height: 10),
                  ]),
              ExpansionTile(
                  title: Text(
                      "Czy w tym miejscu są dostępne noclegi i gastronomia?",
                      style: TextStyle(
                          color: AppColors.primaryNormal,
                          fontWeight: FontWeight.bold)),
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Constants.insideMargin),
                      child: Text(
                          "Ze względu na charakter miejsca zasadniczo nie udostępniamy miejsc noclegowych. Nie prowadzimy także usług gastronomicznych.\n\nDziękujemy za zrozumienie."),
                    ),
                    SizedBox(height: 10),
                  ]),
              ExpansionTile(
                  title: Text("Kim są twórcy aplikacji?",
                      style: TextStyle(
                          color: AppColors.primaryNormal,
                          fontWeight: FontWeight.bold)),
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Constants.insideMargin),
                      child: Text(
                          "Jesteśmy klerykami WSD Salwatorianów w Bagnie, którzy są zaangażowani w Grupę Medialną Salwator (GMS). Zainteresowanie nowymi technologiami chcemy wykorzystać do ewangelizacji, naśladując zapał apostolski naszego założyciela, bł. Franciszka Marii od Krzyża Jordana."),
                    ),
                    SizedBox(height: 10),
                  ]),
            ],
          )),
    );
  }
}
