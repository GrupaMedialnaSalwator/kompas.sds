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
                child: Icon(
                  Icons.lock_clock_outlined,
                  size: 64,
                  color: AppColors.primaryWhite,
                ),
                top: Constants.cardMargin,
                left: Constants.cardMargin,
              )
            ]),
          );
  }
}
