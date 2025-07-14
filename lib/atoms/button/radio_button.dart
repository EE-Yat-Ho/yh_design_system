import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text/text.dart';

final class YHRadioButton extends StatelessWidget {
  const YHRadioButton({
    super.key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.margin = const EdgeInsets.only(bottom: 8),
    this.borderRadius = 8,
    this.backgroundColor,
    this.height = 48,
    this.contentPadding,
    this.dense = true,
    this.font = YHFont.regular16,
    this.textColor = YHColor.contentPrimary,
  });

  final String text;
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  final EdgeInsets margin;
  final double borderRadius;
  final YHColor? backgroundColor;
  final double height;
  final EdgeInsets? contentPadding;
  final bool dense;
  final YHFont font;
  final YHColor textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor?.color ??
            YHColor.contentSecondary.color.withAlpha(51),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: RadioListTile<String>(
        dense: dense,
        title: YHText(
          text: text,
          font: font,
          color: textColor,
        ),
        contentPadding: contentPadding,
        value: value,
        groupValue: groupValue,
        onChanged: (String? value) {
          if (value != null) {
            onChanged(value);
          }
        },
        activeColor: YHColor.primary.color,
      ),
    );
  }
}
