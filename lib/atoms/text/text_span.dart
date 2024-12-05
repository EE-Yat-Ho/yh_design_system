import 'package:flutter/material.dart';
import 'package:yh_design_system/components/text/text_style.dart';

class YHTextSpan {
  const YHTextSpan({
    this.text,
    this.textSpans,
    this.textStyle,
  });

  final String? text;
  final List<YHTextSpan>? textSpans;
  final YHTextStyle? textStyle;

  TextSpan textSpan() {
    return TextSpan(
      text: text,
      style: textStyle?.textStyle(),
      children: textSpans?.map((e) => e.textSpan()).toList(),
    );
  }
}
