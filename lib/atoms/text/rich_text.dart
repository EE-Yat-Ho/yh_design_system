import 'package:flutter/material.dart';
import 'package:yh_design_system/components/text/text_span.dart';

class YHRichText extends StatefulWidget {
  const YHRichText({
    super.key,
    required this.textSpan,
  });

  final YHTextSpan textSpan;

  @override
  State<YHRichText> createState() => _YHRichTextState();
}

class _YHRichTextState extends State<YHRichText> {
  @override
  Widget build(BuildContext context) {
    return RichText(text: widget.textSpan.textSpan());
  }
}
