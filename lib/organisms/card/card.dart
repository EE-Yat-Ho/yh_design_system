import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

class YHCard extends StatelessWidget {
  const YHCard({
    super.key,
    this.elevation = 2,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = YHColor.white,
    this.borderColor,
    this.borderWidth,
    this.onTap,
    required this.child,
  });

  final EdgeInsets margin;
  final EdgeInsets padding;
  final YHColor backgroundColor;
  final YHColor? borderColor;
  final double? borderWidth;
  final double? elevation;
  final GestureTapCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ShapeBorder? shape;
    if (borderColor != null && borderWidth != null) {
      shape = RoundedRectangleBorder(
        side: BorderSide(color: borderColor!.color, width: borderWidth!),
        borderRadius: BorderRadius.circular(10),
      );
    } else {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      );
    }

    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: elevation,
        margin: margin,
        color: backgroundColor.color,
        shape: shape,
        child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: padding,
              child: child,
            )));
  }
}
