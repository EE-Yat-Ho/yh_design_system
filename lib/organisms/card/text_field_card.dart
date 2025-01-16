import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text_field/text_field.dart';
import 'package:yh_design_system/organisms/card/card.dart';

class YHTextFieldCard extends StatelessWidget {
  const YHTextFieldCard({
    super.key,
    this.labelText,
    this.font = YHFont.body3,
    this.controller,
    this.obscureText = false,
    required this.onChanged,
    this.textInputType,
    this.isDense,
    this.autofocus = false,
    this.enabled = true,
    this.focusNode,
    this.maxLines,
    this.placeholder,
    this.borderType = BorderType.none,
    this.cornerRadius = 8,
    this.padding = const EdgeInsets.fromLTRB(16, 4, 32, 4),
    this.right,
    this.hideClear = true,
  });

  final String? labelText;
  final YHFont font;
  final EdgeInsets padding;
  final TextEditingController? controller;
  final bool obscureText;
  final void Function(String) onChanged;
  final TextInputType? textInputType;
  final bool? isDense;
  final bool autofocus;
  final bool enabled;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? placeholder;
  final double cornerRadius;
  final BorderType borderType;
  final Widget? right;
  final bool hideClear;

  @override
  Widget build(BuildContext context) {
    final bgColor = enabled ? YHColor.white : YHColor.disable;

    return YHCard(
      backgroundColor: bgColor,
      child: YHTextField(
        labelText: labelText,
        font: font,
        padding: padding,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        textInputType: textInputType,
        isDense: isDense,
        autofocus: autofocus,
        enabled: enabled,
        focusNode: focusNode,
        maxLines: maxLines,
        placeholder: placeholder,
        cornerRadius: cornerRadius,
        borderType: borderType,
        right: right,
        hideClear: hideClear,
      ),
    );
  }
}
