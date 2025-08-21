import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

final class YHTitle extends StatelessWidget {
  const YHTitle({
    super.key,
    required this.title,
    this.padding = const EdgeInsets.all(8.0),
  });

  final String title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: padding,
        child: YHText(
          text: title,
          font: YHFont.bold24,
          color: YHColor.textDefault,
        ),
      ),
    );
  }
}
