import 'package:flutter/material.dart';
import 'package:gra_terenowa/statics/colors.dart';
import 'package:gra_terenowa/statics/constants.dart';

class CardHeroDisplay extends StatelessWidget {
  const CardHeroDisplay({
    Key? key,
    required this.child,
    required this.enabled,
  }) : super(key: key);

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return enabled
        ? child
        : ColorFiltered(
            colorFilter: ColorFilter.mode(
              AppColors.primaryGray,
              BlendMode.saturation,
            ),
            child:
                Stack(alignment: AlignmentDirectional.bottomStart, children: [
              child,
              Positioned(
                child: IconButton(
                  icon: const Icon(Icons.lock_outline_rounded),
                  iconSize: 64,
                  color: AppColors.primaryWhite,
                  onPressed: () {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Ta przygoda jest na razie zablokowana',
                          style: TextStyle(color: AppColors.primaryWhite),
                        ),
                        backgroundColor: AppColors.primaryNormal,
                        behavior: SnackBarBehavior.fixed,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                ),
                top: Constants.cardMargin,
                left: Constants.cardMargin,
              )
            ]),
          );
  }
}
