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
    this.padding = EdgeInsets.zero,
    this.margin = const EdgeInsets.only(bottom: 8),
    this.borderRadius = 8,
    this.backgroundColor,
  });

  final String text;
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? YHColor.contentSecondary.color.withAlpha(51),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: RadioListTile<String>(
        title: YHText(
          text: text,
          font: YHFont.regular16,
          color: YHColor.contentPrimary,
        ),
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
