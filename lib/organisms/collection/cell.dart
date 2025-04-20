import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/ink_well.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/switch/switch.dart';
import 'package:yh_design_system/atoms/text/text.dart';

enum YHCellRightType {
  none,
  arrow,
  toggle,
}

class YHCell extends StatelessWidget {
  const YHCell({
    super.key,
    this.leftImage,
    required this.title,
    this.subtitle,
    this.rightType = YHCellRightType.arrow,
    this.initialToggleValue,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = YHColor.transparent,
    this.borderColor,
    this.borderWidth,
    this.cornerRadius,
    this.onTap,
    this.onToggle,
  });

  final YHImage? leftImage;
  final String title;
  final String? subtitle;
  final YHCellRightType rightType;
  final bool? initialToggleValue;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final YHColor backgroundColor;
  final YHColor? borderColor;
  final double? borderWidth;
  final double? cornerRadius;
  final void Function()? onTap;
  final void Function(bool)? onToggle;

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return YHInkWell(
        onTap: onTap!,
        child: _buildCell(),
      );
    }
    return _buildCell();
  }

  Widget _buildCell() {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor.color,
        border: borderColor != null
            ? Border.all(color: borderColor!.color, width: borderWidth ?? 1)
            : null,
        borderRadius:
            cornerRadius != null ? BorderRadius.circular(cornerRadius!) : null,
      ),
      child: Row(
        children: [
          if (leftImage != null) leftImage!.icon(width: 48, height: 48),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              YHText(
                  text: title, font: YHFont.regular22, color: YHColor.primary),
              if (subtitle != null)
                YHText(
                    text: subtitle!,
                    font: YHFont.regular14,
                    color: YHColor.gray700),
            ],
          ),
          Spacer(),
          switch (rightType) {
            YHCellRightType.arrow =>
              YHImage.icon_right.icon(width: 24, height: 24),
            YHCellRightType.toggle => YHSwitch(
                initialValue: initialToggleValue ?? false,
                onChanged: onToggle!),
            YHCellRightType.none => SizedBox.shrink(),
          },
        ],
      ),
    );
  }
}
