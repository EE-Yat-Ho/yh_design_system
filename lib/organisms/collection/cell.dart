import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/ink_well.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/decoration/yh_red_dot.dart';
import 'package:yh_design_system/atoms/switch/switch.dart';
import 'package:yh_design_system/atoms/text/text.dart';

enum YHCellRightType {
  none,
  arrow,
  toggle,
  text,
}

class YHCell extends StatelessWidget {
  const YHCell({
    super.key,
    this.leftImage,
    required this.title,
    this.subtitle,
    this.rightText,
    this.rightType = YHCellRightType.arrow,
    this.initialToggleValue,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = YHColor.transparent,
    this.borderColor,
    this.borderWidth,
    this.cornerRadius,
    this.redDot = false,
    this.redDotSize = 6,
    this.onTap,
    this.onToggle,
  });

  final YHImageInterface? leftImage;
  final String title;
  final String? subtitle;
  final String? rightText;
  final YHCellRightType rightType;
  final bool? initialToggleValue;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? cornerRadius;
  final bool redDot;
  final double redDotSize;
  final void Function()? onTap;
  final void Function(bool)? onToggle;

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return YHInkWell(
        onTap: onTap!,
        child: _cell(),
      );
    }
    return _cell();
  }

  Widget _cell() {
    final title = YHText(
        text: this.title, font: YHFont.regular22, color: YHColor.primary);

    Widget? row;
    if (redDot) {
      row = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          Container(
            margin: const EdgeInsets.fromLTRB(2, 4, 0, 0),
            width: redDotSize,
            height: redDotSize,
            decoration: redDotDecoration,
          ),
        ],
      );
    }
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth ?? 1)
            : null,
        borderRadius:
            cornerRadius != null ? BorderRadius.circular(cornerRadius!) : null,
      ),
      child: Row(
        children: [
          // 왼쪽 이미지
          if (leftImage != null) ...[
            leftImage!.icon(width: 48, height: 48),
            const SizedBox(width: 8),
          ],

          // 타이틀, 서브타이틀
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              if (redDot) row! else title,
              if (subtitle != null)
                YHText(
                    text: subtitle!,
                    font: YHFont.regular14,
                    color: YHColor.gray700),
            ],
          ),

          const Spacer(),

          // 오른쪽 타입에 따라 다른 위젯 표시
          switch (rightType) {
            YHCellRightType.arrow =>
              YHImage.icon_right_216.icon(width: 24, height: 24),
            YHCellRightType.toggle => YHSwitch(
                initialValue: initialToggleValue ?? false,
                onChanged: onToggle!),
            YHCellRightType.none => const SizedBox.shrink(),
            YHCellRightType.text => YHText(
                text: rightText!,
                font: YHFont.regular16,
                color: YHColor.gray700,
              ),
          },
        ],
      ),
    );
  }
}
