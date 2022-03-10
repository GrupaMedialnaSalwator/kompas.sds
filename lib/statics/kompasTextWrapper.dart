import 'package:flutter/material.dart';

class KompasText extends StatelessWidget {
  const KompasText({
    Key? key,
    required this.text,
    required this.style,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: style,
    );
  }
}
