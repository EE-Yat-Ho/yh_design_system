import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

final class YHTab extends StatelessWidget {
  const YHTab({
    super.key,
    this.height = 40,
    required this.text,
    this.color,
    this.font = YHFont.regular16,
    this.redDot = false,
  });

  final String text;
  final Color? color;
  final YHFont font;
  final double? height;
  final bool redDot;

  @override
  Widget build(BuildContext context) {
    final tab = Tab(
      height: height,
      child: YHText(
        text: text,
        font: font,
        color: color ?? YHColor.textSub,
      ),
    );

    if (redDot) {
      return Badge(
        backgroundColor: Colors.red,
        child: tab,
      );
    } else {
      return tab;
    }
  }
}
