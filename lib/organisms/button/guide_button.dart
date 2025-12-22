import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

// 누르면 설명 다이얼로그 띄우는 가이드 버튼

final class YHGuideButton extends StatelessWidget {
  const YHGuideButton({
    super.key,
    this.width = 24,
    this.height = 24,
    this.text = "?",
    this.textColor = YHColor.gray500,
    this.font = YHFont.bold14,
    this.backgroundColor,
    required this.onTap,
  });

  final double width;
  final double height;
  final String text;
  final Color textColor;
  final Color? backgroundColor;
  final YHFont font;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return YHButton(
      width: width,
      height: height,
      text: YHText(
        text: text,
        font: font,
        color: textColor,
      ),
      backgroundColor: backgroundColor ?? YHColor.surfaceDefault,
      onTap: onTap,
    );
  }
}
