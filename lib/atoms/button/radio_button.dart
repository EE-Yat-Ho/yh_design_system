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
  });

  final String text;
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  final EdgeInsets margin;
  final double borderRadius;
  final Color? backgroundColor;
  final double height;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
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
