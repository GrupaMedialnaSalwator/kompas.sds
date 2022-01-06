import 'package:flutter/material.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';
import 'package:gra_terenowa/widgets/achievementTracker_widget.dart';

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
                  title: Text("Co mieści się w budynku z napisem \"ToTu\"?",
                      style: TextStyle(
                          color: AppColors.primaryNormal,
                          fontWeight: FontWeight.bold)),
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: Constants.insideMargin),
                      child: Text(
                          "W tym budynku znajduje się Ruch Młodzieży Salwatoriańskiej."),
                    ),
                    SizedBox(height: 10),
                  ]),
            ],
          )),
    );
  }
}
