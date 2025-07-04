import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

final class YHText extends StatelessWidget {
  const YHText(
      {super.key,
      required this.text,
      required this.font,
      required this.color,
      this.fixWidth,
      this.maxLines,
      this.align = TextAlign.left,
      this.withFlexible = false,
      this.decoration});

  final String text;
  final YHFont font;
  final YHColor color;
  final int? maxLines;
  final TextAlign align;
  final TextDecoration? decoration;

  // Row에 넣을 때 오버플로우를 방지하기 위해, 한번 감싸주는 역할
  final bool withFlexible;
  // 고정 width를 설정하기 위한 값
  final double? fixWidth;

  @override
  Widget build(BuildContext context) {
    Text text = Text(
      style: font.style(color: color.color, decoration: decoration),
      this.text,
      maxLines: maxLines,
      textAlign: align,
      overflow: maxLines == null
          ? TextOverflow.visible // 줄 제한 없으면 다 보여줘야함
          : TextOverflow.ellipsis, // 넘치면 ...처리
    );

    if (withFlexible) {
      // Row 내에서 Text가 길 때 오버플로우 되지 않게 넓이를 지정하기 위해 Flexible로 감쌈
      return Flexible(
        fit: FlexFit.loose, // loose로 해야 Text가 짧은땐 짧게 유지됨, tight하면 커질 수 있는만큼 커짐
        child: text,
      );
    } else if (fixWidth != null) {
      return SizedBox(
        width: fixWidth,
        child: text,
      );
    } else {
      return text;
    }
  }
}
