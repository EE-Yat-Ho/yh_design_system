import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

class YHCard extends StatelessWidget {
  const YHCard({
    super.key,
    this.elevation = 2,
    this.margin,
    this.padding,
    this.backgroundColor = YHColor.white,
    this.borderColor,
    this.borderWidth,
    this.onTap,
    required this.child,
  });

  final EdgeInsets? margin;
  final EdgeInsets? padding;
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
    }
    return Card(
        elevation: elevation,
        margin: margin,
        color: backgroundColor.color,
        shape: shape,
        child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: child,
            )));
  }
}
