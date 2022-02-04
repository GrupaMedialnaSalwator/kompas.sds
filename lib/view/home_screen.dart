import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/widgets/achievementTracker_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/constants.dart';
import 'package:gra_terenowa/view/selectTrip_screen.dart';
import 'package:gra_terenowa/widgets/selectTrip_widget.dart';
import 'package:gra_terenowa/widgets/cardHero_widget.dart';
import 'package:gra_terenowa/widgets/tabOutlineIndicator.dart';
import 'package:map_launcher/map_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    // Controllers used throughout the app
    // ignore: unused_local_variable
    final TripDataController _tripDataController =
        Get.put(TripDataController());
    // ignore: unused_local_variable
    final TripStateController _tripStateController =
        Get.put(TripStateController());
    AchievementOperations().readTripScore();
    //tripScore = await AchievementOperations().readAnswerScore();
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        appBar: AppBar(
          title: Text(
            "Witamy w Bagnie",
            style: TextStyle(color: AppColors.primaryDark),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0, // 1
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle_rounded),
              color: AppColors.primaryNormal,
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    "Login to your account",
                    style: TextStyle(color: AppColors.primaryWhite),
                  ),
                  backgroundColor: AppColors.primaryNormal,
                ));
              },
            )
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: AppColors.primaryWhite,
          unselectedLabelColor: AppColors.primaryNormal,
          indicator: TabOutlineIndicator(),
          tabs: [
            Tab(
                icon: Icon(
              LineIcons.tripadvisor,
              //CupertinoIcons.compass,
            )),
            Tab(
                icon: Icon(
              LineIcons.mapMarked,
              //CupertinoIcons.map,
            )),
            Tab(
                icon: Icon(
              LineIcons.firstAid,
              //CupertinoIcons.question,
            )),
          ],
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   margin: EdgeInsets.fromLTRB(36, 36, 0, 72),
                  //   child: Text(
                  //     "Witamy w Bagnie",
                  //     style: Theme.of(context).textTheme.headline5,
                  //   ),
                  // ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(36, 36, 0, 16),
                    child: Text(
                      "Zapraszamy",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(36, 0, 0, 4),
                    child: Text(
                      "do przygody",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(36, 0, 0, 18),
                    child: Text(
                      "w naszym klasztorze",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Container(
                    height: Get.height * Constants.cardHeightRatio,
                    child: ListView.separated(
                      padding: EdgeInsets.all(20),
                      itemCount: 3,
                      separatorBuilder: (BuildContext context, int index) =>
                          VerticalDivider(
                              width: 20, color: AppColors.primaryWhite),
                      itemBuilder: (BuildContext context, int index) {
                        print("Width: " +
                            Get.width.toString() +
                            " and Height: " +
                            Get.height.toString());
                        return CardHero(
                          cardHeight: Get.height * Constants.cardHeightRatio,
                          cardWidth: Get.width * Constants.cardWidthRatio,
                          tripIndex: index,
                          onTap: () {
                            Get.to(() => SelectTripPage(
                                  tripIndex: index,
                                ));
                            Get.bottomSheet(
                              SelectTrip(
                                tripIndex: index,
                                onTapButton: () {},
                              ),
                              isScrollControlled: true,
                              barrierColor:
                                  Color.fromRGBO(0, 0, 0, 0), // 100% opacity
                            ).whenComplete(() => Get.back());
                          },
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              ),
            ),
            Center(child: Text("This tab shows a Map View")),
            Container(
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
                                  margin: EdgeInsets.only(
                                      left: Constants.insideMargin),
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
                                              scale: 15,
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
                                margin: EdgeInsets.only(
                                    left: Constants.insideMargin),
                                child: Text(
                                  "Na terenie Klasztoru w Bagnie mieszka 28 zakonników.",
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(height: 10),
                          ]),
                      ExpansionTile(
                          title: Text(
                              "Co mieści się w budynku z napisem \"ToTu\"?",
                              style: TextStyle(
                                  color: AppColors.primaryNormal,
                                  fontWeight: FontWeight.bold)),
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: Constants.insideMargin),
                              child: Text(
                                  "W tym budynku znajduje się Ruch Młodzieży Salwatoriańskiej."),
                            ),
                            SizedBox(height: 10),
                          ]),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
