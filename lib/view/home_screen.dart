import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/trip_controller.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/widgets/select_widget.dart';
import 'package:gra_terenowa/widgets/tripCard_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This variable allows observing trip data for downloading new trips
    final TripController _tripController = Get.put(TripController());

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
          tabs: [
            Tab(
                icon: Icon(
              CupertinoIcons.compass,
              color: AppColors.primaryNormal,
            )),
            Tab(
                icon: Icon(
              CupertinoIcons.map,
              color: AppColors.primaryNormal,
            )),
            Tab(
                icon: Icon(
              CupertinoIcons.question,
              color: AppColors.primaryNormal,
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
                    height: 350,
                    //width: 250,
                    child: ListView.separated(
                      padding: EdgeInsets.all(20),
                      itemCount: 3,
                      separatorBuilder: (BuildContext context, int index) =>
                          VerticalDivider(
                              width: 20, color: AppColors.primaryWhite),
                      itemBuilder: (BuildContext context, int index) {
                        return tripCard(
                          cardHeight: 350,
                          cardWidth: 250,
                          tripIndex: index,
                          onTapCard: () {
                            Get.bottomSheet(
                              selectTripSheet(tripIndex: index),
                              isScrollControlled: true,
                            );
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
