import 'package:flutter/services.dart';
import 'package:kompas/controller/mapData_controller.dart';
import 'package:kompas/controller/tripState_controller.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/keepAliveWrapper.dart';
import 'package:kompas/widgets/drawerWidget.dart';
import 'package:kompas/widgets/homeView_widget.dart';
import 'package:kompas/widgets/infoView_widget.dart';
import 'package:kompas/widgets/mapView_widget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kompas/controller/tripData_controller.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/widgets/tabOutlineIndicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Controllers used throughout the app
    // ignore: unused_local_variable
    final TripDataController _tripDataController =
        Get.put(TripDataController());
    // ignore: unused_local_variable
    final TripStateController _tripStateController =
        Get.put(TripStateController());
    // ignore: unused_local_variable
    final MapDataController _mapDataController = Get.put(MapDataController());

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        drawer: DrawerWidget(),
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.primaryWhite,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: AppColors.primaryNormal,
            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.dark, // For iOS (dark icons)
          ),
          iconTheme: IconThemeData(color: AppColors.primaryNormal),
          backgroundColor:
              AppColors.primaryWhite.withOpacity(Constants.opacity25),
          foregroundColor: AppColors.primaryWhite,
          elevation: 0,
          title: Text(
            "Witamy w Bagnie",
            style: TextStyle(color: AppColors.primaryDark),
          ),
        ),
        bottomNavigationBar: TabBar(
          labelColor: Color.fromRGBO(238, 241, 241, 1),
          unselectedLabelColor: AppColors.primaryNormal,
          indicator: TabOutlineIndicator(),
          tabs: [
            Tab(
                icon: Icon(
              LineIcons.walking,
              //CupertinoIcons.compass,
            )),
            Tab(
                icon: Icon(
              LineIcons.alternateMapMarked,
              //CupertinoIcons.map,
            )),
            Tab(
                icon: Icon(
              LineIcons.info,
              //CupertinoIcons.question,
            )),
          ],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            KeepAliveWrapper(child: HomeView()),
            KeepAliveWrapper(child: MapView()),
            KeepAliveWrapper(child: InfoView()),
          ],
        ),
      ),
    );
  }
}
