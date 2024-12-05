import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

class YHTextStyle {
  const YHTextStyle({
    required this.font,
    required this.color,
  });

  final YHFont font;
  final YHColor color;

  TextStyle textStyle() {
    return TextStyle(
        color: color.color, fontSize: font.size, fontWeight: font.fontWeight);
  }
}
