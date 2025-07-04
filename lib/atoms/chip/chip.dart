import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

final class YHChip extends StatelessWidget {
  const YHChip({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.borderRadius = 20.0,
    this.font = YHFont.regular14,
  });

  final String text;
  final YHColor? backgroundColor;
  final YHColor? textColor;
  final EdgeInsets padding;
  final double borderRadius;
  final YHFont font;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: (backgroundColor ?? YHColor.primary)
            .color
            .withAlpha((0.1 * 255).toInt()),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: YHText(
        text: text,
        font: font,
        color: textColor ?? YHColor.primary,
      ),
    );
  }
}
