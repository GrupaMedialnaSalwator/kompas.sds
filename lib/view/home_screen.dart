import 'package:flutter/services.dart';
import 'package:kompas/controller/achievementTracker_controller.dart';
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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool shouldRedraw = true; // used to change screen titles on tab change

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Controllers used throughout the app
    // ignore: unused_local_variable
    final TripDataController _tripDataController = Get.put(TripDataController());
    // ignore: unused_local_variable
    final TripStateController _tripStateController = Get.put(TripStateController());
    // ignore: unused_local_variable
    final MapDataController _mapDataController = Get.put(MapDataController());
    // ignore: unused_local_variable
    final AchievementTrackerController _achievementTrackerController = Get.put(AchievementTrackerController());
    _achievementTrackerController.reloadState();

    // Listens to tab change and forces title to redraw
    _tabController.addListener(() {
      setState(() {
        shouldRedraw = true;
      });
    });

    //
    Widget _getTitle(BuildContext context) {
      // Helper function to return different titles for the three main screen views (issue #65)

      if (shouldRedraw == true) {
        // triggers redrawing
        setState(() {
          shouldRedraw = false; // reset after redrawing view
        });
        switch (_tabController.index) {
          case 0:
            return Text('Witamy w Bagnie', style: TextStyle(color: AppColors.primaryDark));
          case 1:
            return Text('Mapka klasztoru', style: TextStyle(color: AppColors.primaryDark));
          case 2:
            return Text('Informacje', style: TextStyle(color: AppColors.primaryDark));
          default:
            assert(false, "_getTitle() error: unexpected screen view");
        }
      }
      return Text('Witamy w Bagnie', style: TextStyle(color: AppColors.primaryDark));
    }

    return Scaffold(
      drawer:
          SizedBox(width: MediaQuery.of(context).size.width * Constants.drawerWidthPercentage, child: DrawerWidget()),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColors.primaryNormal,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        iconTheme: IconThemeData(color: AppColors.primaryNormal),
        backgroundColor: AppColors.primaryWhite.withOpacity(Constants.opacity25),
        foregroundColor: AppColors.primaryWhite,
        elevation: 0,
        title: _getTitle(context),
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        labelColor: AppColors.primaryWhite,
        unselectedLabelColor: AppColors.primaryNormal,
        indicator: TabOutlineIndicator(),
        tabs: [
          Tab(
              icon: Icon(
            LineIcons.compass,
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
      body: WillPopScope(
        // Override back button
        onWillPop: () async {
          if (_tabController.index != 0) {
            _tabController.index = 0;
            return false;
          } else {
            return true;
          }
        },
        child: Container(
          //margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_compass_v3.jpg"),
              //colorFilter: ColorFilter.mode(Colors.white.withOpacity(1.0), BlendMode.modulate),
              fit: BoxFit.cover,
            ),
          ),
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              KeepAliveWrapper(child: HomeView()),
              KeepAliveWrapper(child: MapView()),
              KeepAliveWrapper(child: InfoView()),
            ],
          ),
        ),
      ),
    );
  }
}
