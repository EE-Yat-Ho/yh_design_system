import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

final class YHTextStyle {
  const YHTextStyle({
    required this.font,
    required this.color,
  });

  final YHFont font;
  final Color color;

  TextStyle textStyle() {
    return TextStyle(
        color: color, fontSize: font.fontSize, fontWeight: font.fontWeight);
  }
}
