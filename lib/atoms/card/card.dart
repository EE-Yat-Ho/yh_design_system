import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/ink_well.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

final class YHCard extends StatelessWidget {
  const YHCard({
    super.key,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = YHColor.surfaceDefault,
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
    this.boxShadow, // boxShadow 통째로 넣을 경우
    this.shadowColor, // 그림자 색상
    this.shadowSpreadRadius = 1, // 그림자 확산 반경
    this.shadowBlurRadius = 2, // 그림자 흐림 정도
    this.shadowOffset = const Offset(0, 3), // 그림자 오프셋
  });

  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;
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
  final List<BoxShadow>? boxShadow;
  final Color? shadowColor;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Offset shadowOffset;

  @override
  Widget build(BuildContext context) {
    final bs = boxShadow ??
        [
          BoxShadow(
            color: shadowColor ?? Colors.grey.withValues(alpha: 0.5),
            spreadRadius: shadowSpreadRadius,
            blurRadius: shadowBlurRadius,
            offset: shadowOffset,
          )
        ];
    return Container(
      // padding: padding, 터치 애니메이션에 포함되어야 해서, YHInkWell에 배치.
      margin: margin, // 마진은 밖이라서 괜찮음
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: useShadow ? bs : [],
        borderRadius: BorderRadius.circular(cornerRadius),
        border: borderColor != null && borderWidth != null
            ? Border.all(color: borderColor!, width: borderWidth!)
            : null,
      ),
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
