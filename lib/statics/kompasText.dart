import 'package:flutter/material.dart';

class KompasBodyText extends StatelessWidget {
  const KompasBodyText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}

class KompasTitleText extends StatelessWidget {
  const KompasTitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

