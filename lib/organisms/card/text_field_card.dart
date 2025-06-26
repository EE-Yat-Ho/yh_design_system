import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text_field/text_field.dart';
import 'package:yh_design_system/atoms/card/card.dart';

final class YHTextFieldCard extends StatelessWidget {
  const YHTextFieldCard({
    super.key,
    this.labelText,
    this.font = YHFont.regular16,
    this.controller,
    this.obscureText = false,
    required this.onChanged,
    this.textInputType,
    this.isDense,
    this.autoFocus = false,
    this.enabled = true,
    this.focusNode,
    this.maxLines,
    this.placeholder,
    this.borderType = BorderType.none,
    this.cornerRadius = 8,
    this.padding = const EdgeInsets.fromLTRB(16, 4, 32, 4),
    this.right,
    this.hideClear = true,
    this.elevation = 0,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    // 색 관련
    this.borderColor = YHColor.outline,
    this.disabledBorderColor = YHColor.disable,
    this.focusedBorderColor, // = YHColor.primary
    this.enabledBorderColor, // = YHColor.primary
  });

  final String? labelText;
  final YHFont font;
  final EdgeInsets padding;
  final TextEditingController? controller;
  final bool obscureText;
  final void Function(String) onChanged;
  final TextInputType? textInputType;
  final bool? isDense;
  final bool autoFocus;
  final bool enabled;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? placeholder;
  final double cornerRadius;
  final BorderType borderType;
  final Widget? right;
  final bool hideClear;
  final double elevation;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  // 색 관련
  final YHColor borderColor;
  final YHColor disabledBorderColor;
  final YHColor? focusedBorderColor;
  final YHColor? enabledBorderColor;

  @override
  Widget build(BuildContext context) {
    final bgColor = enabled ? YHColor.white : YHColor.disable;

    return YHCard(
      backgroundColor: bgColor,
      cornerRadius: cornerRadius,
      elevation: elevation,
      child: YHTextField(
        labelText: labelText,
        font: font,
        padding: padding,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        textInputType: textInputType,
        isDense: isDense,
        autoFocus: autoFocus,
        enabled: enabled,
        focusNode: focusNode,
        maxLines: maxLines,
        placeholder: placeholder,
        cornerRadius: cornerRadius,
        borderType: borderType,
        right: right,
        hideClear: hideClear,
        textAlign: textAlign,
        textAlignVertical: textAlignVertical,
        textDirection: textDirection,
        borderColor: borderColor,
        disabledBorderColor: disabledBorderColor,
        focusedBorderColor: focusedBorderColor,
        enabledBorderColor: enabledBorderColor,
      ),
    );
  }
}
