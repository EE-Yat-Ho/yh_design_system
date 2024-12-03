import 'package:flutter/material.dart';
import 'package:yh_design_system/fonts.dart';

class YHTab extends StatelessWidget {
  const YHTab({
    super.key,
    required this.text,
    required this.font,
  });

  final String text;
  final YHFont font;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(fontWeight: font.fontWeight, fontSize: font.size),
      ),
    );
  }
}
