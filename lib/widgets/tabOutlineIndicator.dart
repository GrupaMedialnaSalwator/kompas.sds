import 'package:flutter/material.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';

class TabOutlineIndicator extends Decoration {
  const TabOutlineIndicator({
    this.color = AppColors.primaryNormal,
    this.strokeWidth = 0,
    this.radius = const Radius.circular(Constants.borderRadius),
  });

  final Color color;
  final double strokeWidth;
  final Radius radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _OutlinePainter(
      color: color,
      radius: radius,
      onChange: onChanged,
    );
  }
}

class _OutlinePainter extends BoxPainter {
  _OutlinePainter({
    required this.color,
    required this.radius,
    VoidCallback? onChange,
  })  : _paint = Paint()
          ..style = PaintingStyle.fill
          ..color = color,
        super(onChange);

  final Color color;
  final Radius radius;
  final Paint _paint;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    // compute rounded rectangle specs to fill the icon
    var marginDy = Constants.minMargin;
    var height = configuration.size!.height - (2 * marginDy);
    var width = height + Constants.borderRadius;
    var marginDx = (configuration.size!.width - width) / 2;
    var rect = Rect.fromLTWH(
        offset.dx + marginDx, offset.dy + marginDy, width, height);
    var rrect = RRect.fromRectAndRadius(rect, radius);
    canvas.drawRRect(rrect, _paint);
  }
}
