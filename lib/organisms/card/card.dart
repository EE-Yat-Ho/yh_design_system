import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

class YHCard extends StatelessWidget {
  const YHCard({
    super.key,
    this.elevation = 0,
    this.shadow = true,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = YHColor.surface05,
    this.borderColor,
    this.borderWidth,
    this.cornerRadius = 20,
    this.onTap,
    required this.child,
  });

  final EdgeInsets margin;
  final EdgeInsets padding;
  final YHColor backgroundColor;
  final YHColor? borderColor;
  final double? borderWidth;
  final double cornerRadius;
  final double? elevation;
  final bool shadow;
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ShapeBorder? shape;
    if (borderColor != null && borderWidth != null) {
      shape = RoundedRectangleBorder(
        side: BorderSide(color: borderColor!.color, width: borderWidth!),
        borderRadius: BorderRadius.circular(cornerRadius),
      );
    } else {
      shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      );
    }

    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: shadow ? elevation : 0,
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
