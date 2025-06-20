import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

class YHTab extends StatelessWidget {
  const YHTab({
    super.key,
    this.height = 40,
    required this.text,
    required this.font,
  });

  final String text;
  final YHFont font;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: height,
      child: Text(
        text,
        style: TextStyle(fontWeight: font.fontWeight, fontSize: font.fontSize),
      ),
    );
  }
}
