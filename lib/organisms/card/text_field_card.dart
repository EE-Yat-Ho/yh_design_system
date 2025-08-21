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
    this.borderType = BorderType.outline,
    this.cornerRadius = 8,
    this.padding = const EdgeInsets.fromLTRB(16, 4, 32, 4),
    this.right,
    this.hideClear = true,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    // 색 관련
    this.textColor,
    this.enabledBackgroundColor,
    this.disabledBackgroundColor,
    this.borderColor,
    this.disabledBorderColor,
    this.enabledBorderColor,
    this.focusedBorderColor, // = YHColor.primary
    // 그림자
    this.useShadow = false,
    this.shadow,
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
  final Color? textColor;
  final Color? enabledBackgroundColor;
  final Color? disabledBackgroundColor;
  final Color? borderColor;
  final Color? disabledBorderColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  // 그림자
  final bool useShadow;
  final List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    return YHCard(
      cornerRadius: cornerRadius,
      useShadow: useShadow,
      shadow: shadow,
      child: YHTextField(
        labelText: labelText,
        font: font,
        textColor: textColor ?? YHColor.textDefault,
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
        borderColor: borderColor ?? YHColor.strokeDefault,
        disabledBorderColor:
            disabledBorderColor ?? YHColor.surfaceDisabledStrong,
        focusedBorderColor: focusedBorderColor,
        enabledBorderColor: enabledBorderColor ?? YHColor.strokeDefault,
        enabledBackgroundColor:
            enabledBackgroundColor ?? YHColor.surfaceDefault,
        disabledBackgroundColor:
            disabledBackgroundColor ?? YHColor.surfaceDisabledStrong,
      ),
    );
  }
}
