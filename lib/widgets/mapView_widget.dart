import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Image.asset("assets/images/wsd_map.png"),
      constrained: false,
    );
  }
}
