import 'package:flutter/material.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:kompas/statics/kompasText.dart';
import 'package:kompas/statics/text_styles.dart';

class DrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: AppColors.primaryNormal,
        child: ListView(
          children: <Widget>[
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Image.asset(
                      "assets/images/icons/wsd_logo_white_transparent.png",
                      scale: 7,
                      fit: BoxFit.fitWidth),
                  const SizedBox(height: 24),
                  KompasText(
                      style: AppTextStyles.paragraphText, text: "kompas.sds"),
                  KompasText(
                      style: AppTextStyles.paragraphText,
                      text: "wersja: 0.0.1 (alpha)"),
                      const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(Constants.minMargin),
                    child: TextButton(
                      child: Text("Oceń nas"),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Constants.borderRadius),
                      ))),
                      onPressed: () {
                        print('will open app rating system in the future here');
                      },
                    ),
                  ),
                  buildMenuItem(
                    text: 'kompas.sds',
                    icon: Icons.people,
                  ),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'People',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
  }
}
