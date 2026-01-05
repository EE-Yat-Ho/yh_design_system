import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

final class YHTextSpan {
  const YHTextSpan({
    this.text,
    this.textSpans,
    this.font,
    this.color,
  });

  final String? text;
  final List<YHTextSpan>? textSpans;
  final YHFont? font;
  final Color? color;

  TextSpan textSpan() {
    return TextSpan(
      text: text,
      style: font?.style(color: color),
      children: textSpans?.map((e) => e.textSpan()).toList(),
    );
  }
}
