import 'package:flutter/material.dart';
import 'package:yh_design_system/colors.dart';
import 'package:yh_design_system/fonts.dart';

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
