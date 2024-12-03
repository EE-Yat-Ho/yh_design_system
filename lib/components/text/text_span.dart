// var text = RichText(
//   text: TextSpan(
//     // Note: Styles for TextSpans must be explicitly defined.
//     // Child text spans will inherit styles from parent
//     style: const TextStyle(
//       fontSize: 14.0,
//       color: Colors.black,
//     ),
//     children: <TextSpan>[
//       TextSpan(text: 'Hello'),
//       TextSpan(text: 'World', style: const TextStyle(fontWeight: FontWeight.bold)),
//     ],
//   ),
// );

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
