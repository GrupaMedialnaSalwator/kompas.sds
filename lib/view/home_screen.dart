import 'package:flutter/services.dart';
import 'package:gra_terenowa/controller/mapData_controller.dart';
import 'package:gra_terenowa/controller/tripState_controller.dart';
import 'package:gra_terenowa/widgets/achievementTracker_widget.dart';
import 'package:gra_terenowa/statics/constants.dart';
import 'package:gra_terenowa/statics/keepAliveWrapper.dart';
import 'package:gra_terenowa/widgets/homeView_widget.dart';
import 'package:gra_terenowa/widgets/infoView_widget.dart';
import 'package:gra_terenowa/widgets/mapView_widget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/controller/tripData_controller.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/widgets/tabOutlineIndicator.dart';
import 'package:map_launcher/map_launcher.dart';

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
          backgroundColor:
              AppColors.primaryWhite.withOpacity(Constants.opacity25),
          foregroundColor: AppColors.primaryWhite,
          elevation: 0,
          title: Text(
            "Witamy w Bagnie",
            style: TextStyle(color: AppColors.primaryDark),
          ),
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
