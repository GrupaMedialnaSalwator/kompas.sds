import 'package:flutter/material.dart';

class KompasText extends StatelessWidget {
  const KompasText({
    Key? key,
    required this.text,
    required this.style,
    this.textAlign = TextAlign.left,
    this.maxLines = 10,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      softWrap: true,
    );
  }
}
