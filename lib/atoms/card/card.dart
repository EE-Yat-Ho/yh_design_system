import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/box_shadow/box_shadow.dart';
import 'package:yh_design_system/atoms/button/ink_well.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

final class YHCard extends StatelessWidget {
  const YHCard({
    super.key,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.cornerRadius = 12,
    this.onTap,
    this.onLongPress,
    required this.child,
    this.width,
    this.height,
    // 그림자
    this.useShadow = true, // 그림자 사용 여부
    this.shadow, // boxShadow 통째로 넣을 경우
  });

  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double cornerRadius;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final double? width;
  final double? height;
  // 그림자
  final bool useShadow;
  final List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    final bs = shadow ?? YHBoxShadow.defaultShadow();
    return Container(
      // padding: padding, 터치 애니메이션에 포함되어야 해서, YHInkWell에 배치.
      margin: margin, // 마진은 밖이라서 괜찮음
      decoration: BoxDecoration(
        color: backgroundColor ?? YHColor.surfaceDefault,
        boxShadow: useShadow ? bs : [],
        borderRadius: BorderRadius.circular(cornerRadius),
        border: borderColor != null && borderWidth != null
            ? Border.all(color: borderColor!, width: borderWidth!)
            : null,
      ),
      width: width,
      height: height,
      child: YHInkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        enable: onTap != null,
        cornerRadius: cornerRadius,
        padding: padding,
        child: child,
      ),
    );
  }
}
