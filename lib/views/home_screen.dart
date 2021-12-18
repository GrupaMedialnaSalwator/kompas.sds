import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/routes.dart';
import 'package:gra_terenowa/widgets/select_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<String> tripAssets = [
    "assets/images/trip_01.png",
    "assets/images/trip_02.png",
    "assets/images/trip_03.png",
  ];
  static const List<String> tripTitles = [
    "W Parku",
    "W Labiryncie",
    "Droga Krzyżowa",
  ];

  @override
  Widget build(BuildContext context) {
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
                        return Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                SelectWidget(args: Arguments(index)),
                                isScrollControlled: true,
                              );

                              // Get.toNamed(AppRoutes.select,
                              //                               arguments: Arguments(index)),
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 350,
                                  width: 250,
                                  padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.bottomLeft,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(tripAssets[index]),
                                      fit: BoxFit.fitWidth, //DecorationImage
                                    ),
                                  ), //BoxDecoration

                                  child: Text(
                                    tripTitles[index],
                                    //style: Theme.of(context).textTheme.headline2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        ?.copyWith(
                                            color: AppColors.primaryWhite),
                                  ),
                                ), //Text

                                // Image.asset(
                                //   tripAssets[index],
                                //   fit: BoxFit.fitWidth,
                                // ),
                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 8,
                          margin: EdgeInsets.all(4),
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
