import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gra_terenowa/extras/colors.dart';
import 'package:gra_terenowa/extras/routes.dart';

class SelectPage extends StatefulWidget {
  SelectPage({Key? key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  late final Arguments _args;

  @override
  void initState() {
    super.initState();
    _args = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/images/trip_0" + (_args.index + 1).toString() + ".png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4 - 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6 + 30,
              decoration: BoxDecoration(
                color: AppColors.primaryNormal,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                  bottom: Radius.zero,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      "Title " + _args.index.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(color: AppColors.primaryWhite),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      "Description ...",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: AppColors.primaryWhite),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(60)),
                  TextButton(
                    child: Text("Zaczynamy"),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
