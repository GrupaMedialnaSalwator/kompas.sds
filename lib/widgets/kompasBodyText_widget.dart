import 'package:flutter/material.dart';

class KompasBodyTextWidget extends StatelessWidget {
  const KompasBodyTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
