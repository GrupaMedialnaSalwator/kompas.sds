import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/statics.dart';
import 'package:gra_terenowa/view/selectTrip_screen.dart';
import 'package:gra_terenowa/widgets/selectTrip_widget.dart';
import 'package:gra_terenowa/widgets/cardHero_widget.dart';
import 'package:gra_terenowa/widgets/tabOutlineIndicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controllers used throughout the app
    // ignore: unused_local_variable
    final TripDataController _tripDataController =
        Get.put(TripDataController());
    // ignore: unused_local_variable
    final TripStateController _tripStateController =
        Get.put(TripStateController());

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
                    height: Get.height * Statics.cardHeightRatio,
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
                          cardHeight: Get.height * Statics.cardHeightRatio,
                          cardWidth: Get.width * Statics.cardWidthRatio,
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
            Center(child: Text("This tab shows a Help View")),
          ],
        ),
      ),
    );
  }
}
