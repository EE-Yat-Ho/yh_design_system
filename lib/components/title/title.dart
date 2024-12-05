import 'package:flutter/material.dart';
import 'package:yh_design_system/colors.dart';
import 'package:yh_design_system/molecules/text.dart';
import 'package:yh_design_system/fonts.dart';

class YHTitle extends StatelessWidget {
  const YHTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: YHText(
          text: title,
          font: YHFont.h1,
          color: YHColor.black,
        ),
      ),
    );
  }
}
