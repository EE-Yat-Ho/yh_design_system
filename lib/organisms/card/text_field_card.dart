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
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    // 색 관련
    this.enabledBackgroundColor = YHColor.white,
    this.disabledBackgroundColor = YHColor.disable,
    this.borderColor = YHColor.outline,
    this.disabledBorderColor = YHColor.disable,
    this.enabledBorderColor = YHColor.outline,
    this.focusedBorderColor, // = YHColor.primary
    // 그림자
    this.useShadow = false,
    this.boxShadow,
    this.shadowColor,
    this.shadowSpreadRadius,
    this.shadowBlurRadius,
    this.shadowOffset,
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
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  // 색 관련
  final YHColor enabledBackgroundColor;
  final YHColor disabledBackgroundColor;
  final YHColor borderColor;
  final YHColor disabledBorderColor;
  final YHColor? focusedBorderColor;
  final YHColor enabledBorderColor;
  // 그림자
  final bool useShadow;
  final List<BoxShadow>? boxShadow;
  final Color? shadowColor;
  final double? shadowSpreadRadius;
  final double? shadowBlurRadius;
  final Offset? shadowOffset;

  @override
  Widget build(BuildContext context) {
    return YHCard(
      backgroundColor:
          enabled ? enabledBackgroundColor : disabledBackgroundColor,
      cornerRadius: cornerRadius,
      useShadow: useShadow,
      boxShadow: boxShadow,
      shadowColor: shadowColor,
      shadowSpreadRadius: shadowSpreadRadius,
      shadowBlurRadius: shadowBlurRadius,
      shadowOffset: shadowOffset,
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
