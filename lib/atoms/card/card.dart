import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/ink_well.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

final class YHCard extends StatelessWidget {
  const YHCard({
    super.key,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = YHColor.surface05,
    this.borderColor,
    this.borderWidth,
    this.cornerRadius = 20,
    this.onTap,
    required this.child,
    this.width,
    this.height,
    // 그림자
    this.useShadow = true, // 그림자 사용 여부
    this.boxShadow, // boxShadow 통째로 넣을 경우
    this.shadowColor, // 그림자 색상
    this.shadowSpreadRadius = 2, // 그림자 확산 반경
    this.shadowBlurRadius = 3, // 그림자 흐림 정도
    this.shadowOffset = const Offset(0, 4), // 그림자 오프셋
  });

  final EdgeInsets margin;
  final EdgeInsets padding;
  final YHColor backgroundColor;
  final YHColor? borderColor;
  final double? borderWidth;
  final double cornerRadius;
  final void Function()? onTap;
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
    // ShapeBorder? shape;
    // if (borderColor != null && borderWidth != null) {
    //   shape = RoundedRectangleBorder(
    //     side: BorderSide(color: borderColor!.color, width: borderWidth!),
    //     borderRadius: BorderRadius.circular(cornerRadius),
    //   );
    // } else {
    //   shape = RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(cornerRadius),
    //   );
    // }

    // return Card(
    // clipBehavior: Clip.antiAlias,
    // elevation: shadow ? elevation : 0,
    // shape: shape,
    // child:
    final bs = boxShadow ??
        [
          BoxShadow(
            color: shadowColor ?? Colors.grey.withValues(alpha: 0.5),
            spreadRadius: shadowSpreadRadius,
            blurRadius: shadowBlurRadius,
            offset: shadowOffset,
          )
        ];
    return YHInkWell(
      onTap: onTap,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor.color,
          boxShadow: useShadow ? bs : [],
          borderRadius: BorderRadius.circular(cornerRadius),
          border: borderColor != null && borderWidth != null
              ? Border.all(
                  color: borderColor!.color,
                  width: borderWidth!,
                )
              : null,
        ),
        child: Container(
          margin: margin,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
